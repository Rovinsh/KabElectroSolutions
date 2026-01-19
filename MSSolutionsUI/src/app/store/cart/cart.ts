import { Component, OnInit, OnDestroy, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Subscription } from 'rxjs';
import { CartItem, CartService } from '../services/cart.service';
import { RouterModule,Router } from '@angular/router';
import { LoginComponent } from '../Login/login.component';
import { WishlistService } from '../services/wishlist.service';
import { ToastService } from '../../services/toastService.service';
import { AuthService } from '../../services/auth';
import { MatDialog, MatDialogModule } from '@angular/material/dialog';
import { ApiService } from '../../services/api.service';
import { CouponDialogComponent } from '../coupon-dialog/coupon-dialog';
@Component({
  selector: 'app-cart',
  standalone: true,
  imports: [CommonModule,RouterModule,MatDialogModule],   // ✅ REQUIRED
  templateUrl: './cart.html',
  styleUrls: ['./cart.css']
})
export class CartComponent implements OnInit, OnDestroy {
  wishlistIds: Set<number> = new Set();
  pendingWishlistProductId: number | null = null;
  cartItems: CartItem[] = [];
  total = 0;
  private sub?: Subscription;
  private wishlistService = inject(WishlistService);
  private toast = inject(ToastService);
  private auth = inject(AuthService);
  private apiService = inject(ApiService);
  isLoggedIn = false;
  couponApplied = false;
  appliedCouponCode = '';
  couponDiscount = 0;
  subtotal = 0;
  constructor(private cartService: CartService,private dialog: MatDialog,private router: Router) {}

ngOnInit(): void {
  // Subscribe to cart items
  this.sub = this.cartService.cartItems$.subscribe(items => {

    // Map items to include GST and finalAmount
    this.cartItems = items.map(item => {
      const gstAmount = (item.price * item.gstPercent) / 100;

      return {
        ...item,
        gstAmount,
        // finalAmount includes coupon if already applied
        finalAmount: (item.price - (item.couponDiscount ?? 0)) + gstAmount
      };
    });

    // Subtotal before GST and coupon
    this.subtotal = this.cartItems.reduce(
      (sum, item) => sum + item.price * item.quantity,
      0
    );

    // Total coupon discount from all items
    this.couponDiscount = this.cartItems.reduce(
      (sum, item) => sum + (item.couponDiscount ?? 0),
      0
    );

    // Mark coupon as applied if any item has a discount
    const anyCoupon = this.cartItems.some(item => item.couponDiscount && item.couponDiscount > 0);
    this.couponApplied = anyCoupon;

    // Get applied coupon code from service
    this.appliedCouponCode = anyCoupon ? this.cartService.couponCode : '';
  });

  // Check if user is logged in
  this.isLoggedIn = !!localStorage.getItem('token');

  // Load wishlist if logged in
  if (this.isLoggedIn) {
    this.apiService.getWishlist().subscribe(res => {
      if (res.data) {
        const ids = res.data.map((x: any) => x.productId ?? x.ProductId);
        this.wishlistIds = new Set(ids);
      }
    });
  }

  // Subscribe to wishlist changes
  this.wishlistService.wishlistIds$.subscribe(ids => {
    this.wishlistIds = ids;
  });
}


 isInWishlist(productId: number): boolean {
    return this.wishlistService.isInWishlist(productId);
  }
  ngOnDestroy(): void {
    this.sub?.unsubscribe();
  }

  remove(id: number) {
    this.cartService.removeFromCart(id);
  }
getDiscountPercentage(basePrice: number, finalPrice: number): number {
  if (!basePrice || basePrice <= 0) return 0;

  const discountPercent =
    ((basePrice - finalPrice) / basePrice) * 100;

  return Math.round(discountPercent); // round for UI
}

  onWishlistClick(productId: number) {
    if (!this.auth.isLoggedIn()) {
      this.pendingWishlistProductId = productId;
      this.openLoginPopup();
      return;
    }
    this.wishlistService.addWishlist(productId);
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

  openCouponPopup() {
  const dialogRef = this.dialog.open(CouponDialogComponent, {
    width: '520px',
    disableClose: true,
    panelClass: 'coupon-modal'
  });

  dialogRef.afterClosed().subscribe(result => {
    if (result) {
      this.couponApplied = true;
      this.appliedCouponCode = result.couponCode;
       this.couponDiscount = result.discountAmount;
        this.cartService.applyCoupon(
      result.couponCode,
      result.discountAmount
    );
  }
  });
}

onCheckout() {
    if (this.auth.isLoggedIn()) {
    this.router.navigate(['/store/checkout']);
  } else {
    const dialogRef = this.dialog.open(LoginComponent, {
      width: '400px',
      disableClose: true,
      data: { redirectUrl: '/store/checkout' }
    });

    dialogRef.afterClosed().subscribe(success => {
      if (success === true) {
        this.router.navigate(['/store/checkout']);
      }
    });
  }
}

get grandTotal(): number {
  const total = this.cartItems.reduce(
    (sum, item) => sum + (item.finalAmount ?? 0) * item.quantity,
    0
  );
  return +total.toFixed(2);
}
get totalGst(): number {
  const gst = this.cartItems.reduce(
    (sum, item) => sum + (item.gstAmount ?? 0) * item.quantity,
    0
  );

  return +gst.toFixed(2);
}
}
