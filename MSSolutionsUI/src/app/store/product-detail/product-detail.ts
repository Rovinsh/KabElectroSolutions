import { Component, inject, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ActivatedRoute, RouterModule } from '@angular/router';
import { CartService } from '../services/cart.service';
import { ApiService, ProductWithImagesDto, ProductImageDto, OrderDTO, ReviewDto } from '../../services/api.service';
import { CartPopupComponent } from '../shared/cart-popup/cart-popup.component';
import { MatDialog, MatDialogModule } from '@angular/material/dialog';
import { AuthService } from '../../services/auth';
import { ToastService } from '../../services/toastService.service';
import { LoginComponent } from '../Login/login.component';
import { WishlistService } from '../services/wishlist.service';
import { ReviewFormComponent } from '../review-form/review-form';
@Component({
  selector: 'app-product-detail',
  standalone: true,
  imports: [CommonModule, RouterModule, MatDialogModule],
  templateUrl: './product-detail.html',
  styleUrls: ['./product-detail.css']
})
export class ProductDetailComponent implements OnInit {
  wishlistIds: Set<number> = new Set();
  pendingWishlistProductId: number | null = null;
  orders: OrderDTO[] = [];
  reviewComment:ReviewDto[]=[];
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
  const productUrl = this.route.snapshot.paramMap.get('productUrl');

    this.apiService.getProductbyUrl(productUrl).subscribe(res => {
     this.productList = res.data;
    const found = this.productList.find(p => p.productUrl === productUrl);
      if (!found) {
        console.error('Product not found for Url:', productUrl);
        return;
      }

      this.product = found;  
    if (this.product?.images?.length) {
      this.selectedImage = this.resolveImage(this.product.images[0]);
      this.activeIndex = 0;
    }
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
    this.loadOrders();
    this.loadReviewComment();
      }, error => {
    console.error("Product not found", error);
  });

  }


  loadReviewComment() {
    this.apiService.getReviewComment().subscribe(res => {
      this.reviewComment = res.data.sort((a: any, b: any) => a.orderCode.localeCompare(b.orderCode));
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

getAverageRating(): number {
  if (!this.reviewComment || this.reviewComment.length === 0) {
    return 0;
  }

  const total = this.reviewComment.reduce(
    (sum: number, r: any) => sum + (r.rating || 0),
    0
  );

  return +(total / this.reviewComment.length).toFixed(1);
}

  onWishlistClick(productId: number) {
    if (!this.auth.isLoggedIn()) {
      this.pendingWishlistProductId = productId;
      this.openLoginPopup();
      return;
    }
    this.wishlistService.addWishlist(productId);
  }

  isSpecOpen = false;
  showMoreSpecs = false;

toggleSpec() {
  this.isSpecOpen = !this.isSpecOpen;

  // reset view more when collapsing
  if (!this.isSpecOpen) {
    this.showMoreSpecs = false;
  }
}

toggleViewMore() {
  this.showMoreSpecs = !this.showMoreSpecs;
}
isReviewOpen = false;

reviews = [
  {
    user: 'Rahul S',
    rating: 5,
    comment: 'Excellent service. Easy claim process and quick support.',
    date: 'Jan 2025'
  },
  {
    user: 'Anita P',
    rating: 4,
    comment: 'Worth the price. Peace of mind after warranty.',
    date: 'Dec 2024'
  }
];

toggleReview() {
  this.isReviewOpen = !this.isReviewOpen;
}
  loadOrders() {
    this.apiService.getUserOrders().subscribe(res => {
      this.orders = res.data.sort((a: any, b: any) => a.orderCode.localeCompare(b.orderCode));
    });
  }

openReviewForm() {
   if (!this.auth.isLoggedIn()) {
      this.pendingWishlistProductId = this.product.id;
      this.openLoginPopup();
      return;
    }
    else{
    if(this.hasPurchasedProduct(this.product.id)){
    this.openReviewPopup();
      }else{
    this.toast.error(` You can only review products purchased from your account`);
      }
    }
  }

  hasPurchasedProduct(productId: number): boolean {
    return this.orders.some(o => o.id === productId);
  }

   openReviewPopup() {
    const dialogRef = this.dialog.open(ReviewFormComponent, {
      width: '500px',
      maxWidth: '95vw',
      maxHeight: '90vh',
      disableClose: true,
      panelClass: 'review-dialog',
    });

    dialogRef.afterClosed().subscribe(() => {
      console.log('Review popup closed');
      this.loadReviewComment();
    });
  }
}