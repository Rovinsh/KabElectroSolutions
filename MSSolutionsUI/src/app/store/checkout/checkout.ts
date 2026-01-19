import { Component, OnInit, OnDestroy, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Subscription } from 'rxjs';
import { CartItem, CartService } from '../services/cart.service';
import { RouterModule } from '@angular/router';
import { LoginComponent } from '../Login/login.component';
import { WishlistService } from '../services/wishlist.service';
import { ToastService } from '../../services/toastService.service';
import { AuthService } from '../../services/auth';
import { MatDialog, MatDialogModule } from '@angular/material/dialog';
import { AddressDto, ApiService } from '../../services/api.service';
@Component({
  selector: 'app-checkout',
  standalone: true,
  imports: [CommonModule,RouterModule,MatDialogModule],   // ✅ REQUIRED
  templateUrl: './checkout.html',
  styleUrls: ['./checkout.css']
})
export class CheckoutComponent implements OnInit, OnDestroy {
  wishlistIds: Set<number> = new Set();
  pendingWishlistProductId: number | null = null;
  cartItems: CartItem[] = [];
  total = 0;
  subtotal = 0;
  gstTotal = 0;
  couponDiscount = 0;
  grandTotal = 0;
  private sub?: Subscription;
  private wishlistService = inject(WishlistService);
  private toast = inject(ToastService);
  private auth = inject(AuthService);
  private apiService = inject(ApiService);
  isLoggedIn = false;
  addresses: AddressDto[] = [];
  // Selected addresses
  selectedShippingAddress?: AddressDto;
  selectedBillingAddress?: AddressDto;

// Flag to use shipping address as billing
useShippingAsBilling = true;
  constructor(private cartService: CartService,private dialog: MatDialog) {}

ngOnInit(): void {
  this.sub = this.cartService.cartItems$.subscribe(items => {
    this.cartItems = items;

    // Subtotal BEFORE coupon & GST
    this.subtotal = +items.reduce(
      (sum, item) => sum + item.price * item.quantity,
      0
    ).toFixed(2);

    // GST total (already calculated in cart page)
    this.gstTotal = +items.reduce(
      (sum, item) => sum + (item.gstAmount ?? 0) * item.quantity,
      0
    ).toFixed(2);

    // Coupon discount (already distributed in cart page)
    this.couponDiscount = +items.reduce(
      (sum, item) => sum + (item.couponDiscount ?? 0),
      0
    ).toFixed(2);

    // FINAL PAYABLE — SAME AS CART PAGE
    this.grandTotal = +items.reduce(
      (sum, item) => sum + (item.finalAmount ?? 0) * item.quantity,
      0
    ).toFixed(2);
  });
  this.loadAddress();
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

loadAddress(){
  this.apiService.getUserAddresses().subscribe(res => {
  this.addresses = res.data; 

  // Optional: set default shipping/billing
  this.selectedShippingAddress = this.addresses.find(a => a.isDefault);
  if (this.useShippingAsBilling) {
    this.selectedBillingAddress = this.selectedShippingAddress;
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
  
}
