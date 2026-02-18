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
import { FormsModule } from '@angular/forms';
import{UserDeliveryAddress} from '../user-delivery-Address/user-delivery-address'
@Component({
  selector: 'app-checkout',
  standalone: true,
  imports: [CommonModule,RouterModule,MatDialogModule,FormsModule],   // ✅ REQUIRED
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
  couponCode='';
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
    if (items.length > 0) {
      this.couponCode = items[0].couponCode || '';
    }
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

onChangeAddress() {
  const dialogRef = this.dialog.open(UserDeliveryAddress, {
    width: '700px',
    maxWidth: '95vw',
    maxHeight: '90vh',
    disableClose: true,
    panelClass: 'address-dialog',
    data: {
      addresses: this.addresses,
      selectedShipping: this.selectedShippingAddress,
      selectedBilling: this.selectedBillingAddress,
      useShippingAsBilling: this.useShippingAsBilling
    }
  });

  dialogRef.afterClosed().subscribe((result) => {
    if (!result) return;

    // Update selected addresses from popup result
    this.selectedShippingAddress = result.selectedShipping;
    this.selectedBillingAddress = result.selectedBilling;
    this.useShippingAsBilling = result.useShippingAsBilling;
  });
}


onChangeBillingAddress() {
  console.log('Change billing address');
}
proceedToPayment() {

  if (!this.selectedShippingAddress) {
    this.toast.error("Please select address");
    return;
  }

  const payload = {

  shippingAddressId: this.selectedShippingAddress.id,

  billingAddressId: this.useShippingAsBilling
    ? this.selectedShippingAddress.id
    : (this.selectedBillingAddress?.id ?? null),

  useShippingAsBilling: this.useShippingAsBilling,

  couponCode: this.cartService.couponCode || null,

  cartItems: this.cartItems.map(item => ({
    productId: item.productId,
    quantity: item.quantity
  }))

};

  this.apiService.createPayment(payload).subscribe(res => {
  const form = document.createElement('form');
  form.method = 'POST';
  form.action = res.apiUrl;

  ['request', 'checksum', 'merchantId'].forEach(k => {
    const input = document.createElement('input');
    input.type = 'hidden';
    input.name = k;
    input.value = res[k];
    form.appendChild(input);
  });

  document.body.appendChild(form);
  form.submit();
    });
}
}
