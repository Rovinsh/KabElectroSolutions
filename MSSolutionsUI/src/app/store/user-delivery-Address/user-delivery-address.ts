import { Component, inject, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ActivatedRoute, RouterModule } from '@angular/router';
import { CartService } from '../services/cart.service';
import { ApiService, ProductWithImagesDto, ProductImageDto } from '../../services/api.service';
import { CartPopupComponent } from '../shared/cart-popup/cart-popup.component';
import { MatDialog, MatDialogModule } from '@angular/material/dialog';
import { AuthService } from '../../services/auth';
import { ToastService } from '../../services/toastService.service';
import { LoginComponent } from '../Login/login.component';
import { WishlistService } from '../services/wishlist.service';

@Component({
  selector: 'app-user-delivery-address',
  standalone: true,
  imports: [CommonModule, RouterModule, MatDialogModule],
  templateUrl: './user-delivery-address.html',
  styleUrls: ['./user-delivery-address.css']
})
export class UserDeliveryAddress implements OnInit {
  wishlistIds: Set<number> = new Set();
  pendingWishlistProductId: number | null = null;
  private wishlistService = inject(WishlistService);
  private apiService = inject(ApiService);
  private toast = inject(ToastService);
  private auth = inject(AuthService);
  productList: ProductWithImagesDto[] = [];
  product!: ProductWithImagesDto;

  qty = 1;

  currentIndex = 0;
  visibleThumbs = 4;
  activeIndex = 0;
  selectedImage: string = '';
  isLoggedIn = false;
  constructor(
    private route: ActivatedRoute,
    private dialog: MatDialog,
    private cartService: CartService
  ) {}

  ngOnInit(): void {
    const id = Number(this.route.snapshot.paramMap.get('id'));

    this.apiService.getProduct().subscribe(res => {
      this.productList = res.data.filter(x => x.isActive);

      const found = this.productList.find(p => p.id === id);

      if (!found) {
        console.error('Product not found for id:', id);
        return;
      }

      this.product = found;

      if (this.product.images?.length) {
        this.selectedImage = this.resolveImage(this.product.images[0]);
        this.activeIndex = 0;
      }
    });
    this.isLoggedIn = !!localStorage.getItem('token');
      if (this.isLoggedIn) {
        this.apiService.getWishlist().subscribe(res => {
          if (res.data) {
            const ids = res.data.map((x: any) => x.productId ?? x.ProductId);
            this.wishlistIds = new Set(ids);
          }
        });
      }
    this.wishlistService.wishlistIds$.subscribe(ids => {
    this.wishlistIds = ids;
    });
  }



 isInWishlist(productId: number): boolean {
    return this.wishlistService.isInWishlist(productId);
  }
  /** Convert API image object into usable image src */
  resolveImage(img: ProductImageDto): string {
    if (img.imageBase64) {
      return `data:image/webp;base64,${img.imageBase64}`;
    }

    return `https://your-api-domain.com/uploads/${img.fileName}`;
  }

  /** Slider visible images */
  get visibleImages(): string[] {
    return this.product?.images
      ?.slice(this.currentIndex, this.currentIndex + this.visibleThumbs)
      .map(img => this.resolveImage(img)) || [];
  }

  nextThumb() {
    if (this.currentIndex + this.visibleThumbs < this.product.images.length) {
      this.currentIndex++;
    }
  }

  prevThumb() {
    if (this.currentIndex > 0) {
      this.currentIndex--;
    }
  }

  selectImage(img: string, index: number) {
    this.selectedImage = img;
    this.activeIndex = index + this.currentIndex;
  }

  addToCart(product: ProductWithImagesDto) {
    this.cartService.addToCart(product);
    this.openCardPopup(product);
  }
  getFinalPrice(product: ProductWithImagesDto): number {
    return product.discountPrice
      ? product.baseAmount - product.discountPrice
      : product.baseAmount;
  }

  getDiscountPercent(product: ProductWithImagesDto): number | null {
    if (!product.discountPrice) return null;
    return Math.round((product.discountPrice / product.baseAmount) * 100);
  }

  openCardPopup(data?: ProductWithImagesDto) {
    const dialogRef = this.dialog.open(CartPopupComponent, {
      width: '500px',
      maxWidth: '95vw',
      maxHeight: '90vh',
      disableClose: true,
      panelClass: 'cart-dialog',
      data
    });

    dialogRef.afterClosed().subscribe(() => {
      console.log('Cart popup closed');
    });
  }
   private openLoginPopup() {
    const dialogRef = this.dialog.open(LoginComponent, {
      width: '700px',
      maxWidth: '95vw',
      maxHeight: '90vh',
      disableClose: true,
      panelClass: 'login-dialog'
    });

    dialogRef.afterClosed().subscribe(loggedIn => {
      if (loggedIn && this.pendingWishlistProductId !== null) {
        this.wishlistService.addWishlist(this.pendingWishlistProductId);
        this.pendingWishlistProductId = null;
      }
    });
  }


  onWishlistClick(productId: number) {
    if (!this.auth.isLoggedIn()) {
      this.pendingWishlistProductId = productId;
      this.openLoginPopup();
      return;
    }
    this.wishlistService.addWishlist(productId);
  }
}