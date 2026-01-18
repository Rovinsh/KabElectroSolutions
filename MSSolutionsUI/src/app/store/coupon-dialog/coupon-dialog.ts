import { Component, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatDialogRef } from '@angular/material/dialog';
import { FormsModule } from '@angular/forms';
import { ApiService, ApplyCouponRequestDto } from '../../services/api.service';
import { ToastService } from '../../services/toastService.service';
import { CartService } from '../services/cart.service';

@Component({
  selector: 'app-coupon-dialog',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './coupon-dialog.html',
  styleUrls: ['./coupon-dialog.css']
})
export class CouponDialogComponent {

  couponCode = '';
  loading = false;
  couponApplied = false;
  appliedCouponCode = '';
  private dialogRef = inject(MatDialogRef<CouponDialogComponent>);
  private apiService = inject(ApiService);
  private toast = inject(ToastService);
  private cartService= inject(CartService);
  close() {
    this.dialogRef.close();
  }

applyCoupon() {
  if (!this.couponCode.trim()) {
    this.toast.info('Please enter coupon code');
    return;
  }

  const cartItems = this.cartService.getCartItems();

  if (!cartItems.length) {
    this.toast.info('Cart is empty');
    return;
  }

  const payload: ApplyCouponRequestDto = {
    couponCode: this.couponCode.trim().toUpperCase(),

    cartTotal: cartItems.reduce(
      (sum, item) => sum + item.price * item.quantity,
      0
    ),

    productIds: cartItems.map(item => item.productId)
  };

  this.loading = true;

  this.apiService.applyCoupon(payload).subscribe({
    next: (res) => {
      //  this.couponApplied = true;
      // this.appliedCouponCode = res.data.couponCode;
      this.toast.success('Coupon applied successfully 🎉');

      this.dialogRef.close(res);   // return discount data
      this.loading = false;
    },
    error: (err) => {
      this.toast.error(err?.error ?? 'Invalid coupon');
      this.loading = false;
    }
  });
}


}
