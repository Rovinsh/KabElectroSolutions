import { Component, inject, Input } from '@angular/core';
import { CommonModule } from '@angular/common';
import { CartService } from '../services/cart.service';
import { ApiService,ProductWithImagesDto } from '../../services/api.service';
import { AuthService } from '../../services/auth';
import { CartPopupComponent } from '../shared/cart-popup/cart-popup.component';
import { LoginComponent } from '../Login/login.component';
import { MatDialog, MatDialogModule } from '@angular/material/dialog';
import { RouterModule } from '@angular/router';
import { ToastService } from '../../services/toastService.service';
@Component({
  selector: 'app-product-card',
  standalone: true,
  imports: [CommonModule,MatDialogModule,RouterModule],
  templateUrl: './product-card.component.html',
  styleUrls: ['./product-card.component.css']
})
export class ProductCardComponent {
  private apiService = inject(ApiService);
  private toast = inject(ToastService);
  private auth = inject(AuthService);
  wishlistIds = new Set<number>();
  isLoggedIn = false;
  pendingWishlistProductId: number | null = null;
  showCartPopup = false;
  popupProductName = '';
  popupPrice = 0;
  popupImage = '';

   @Input() product!: ProductWithImagesDto;
    constructor(private dialog: MatDialog,private cartService: CartService) {
    }

ngOnInit() {
  this.isLoggedIn = !!localStorage.getItem('token');
 if (this.isLoggedIn) {
    this.loadWishlist();
}
}

private loadWishlist(): void {
  this.apiService.getWishlist().subscribe(res => {
    if (!res?.data?.length) {
      return;
    }
    const ids = res.data.map((item: any) => item.productId ?? item.ProductId);
    this.wishlistIds = new Set(ids);
  });
}


isInWishlist(productId: number): boolean {
  return this.wishlistIds.has(productId);
}

  getPrimaryImage(product: ProductWithImagesDto): string {
    return product.images?.length
      ? 'data:image/jpeg;base64,' + product.images[0].imageBase64
      : 'assets/no-image.png';
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


addToCart(product: ProductWithImagesDto) {
  this.cartService.addToCart(product);
  this.openCardPopup(product);
}
openCardPopup(data?: ProductWithImagesDto) {
  const dialogRef = this.dialog.open(CartPopupComponent, {
    width: '500px',
    maxWidth: '95vw',
    maxHeight: '90vh',
    disableClose: true,
    panelClass: 'cart-dialog',
    data: data
  });

  dialogRef.afterClosed().subscribe(() => {
    console.log('Cart popup closed');
  });
}

 onWishlistClick(productId: number) {
    if (!this.auth.isLoggedIn()) {
      this.pendingWishlistProductId = productId;
      this.openLoginPopup();
      return;
    }
    this.saveWishlist(productId);
  }
  private openLoginPopup() {
    const dialogRef = this.dialog.open(LoginComponent, {
      width: '700px',
      maxWidth: '95vw',
      maxHeight: '90vh',
      disableClose: true,
      panelClass: 'login-dialog'
    });

    dialogRef.afterClosed().subscribe((loggedIn: boolean) => {
      if (loggedIn && this.pendingWishlistProductId !== null) {
        this.saveWishlist(this.pendingWishlistProductId);
        this.pendingWishlistProductId = null;
      }
    });
  }
  saveWishlist(productId: number) {
    this.apiService.addWishlist(productId).subscribe({
      next: () => {
        this.toast.success('Added to wishlist ❤️');
        this.wishlistIds.add(productId);
      },
      error: err => {
        if (err.status === 409) {
          this.toast.info('Already in wishlist');
        } else {
          this.toast.error('Failed to add wishlist');
        }
      }
    });
  }
}
