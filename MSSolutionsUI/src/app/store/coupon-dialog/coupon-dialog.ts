import { Component, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatDialogRef } from '@angular/material/dialog';
import { FormsModule } from '@angular/forms';
import { ApiService, ApplyCouponRequestDto, ApplyCouponResponseDto } from '../../services/api.service';
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

  private dialogRef = inject(MatDialogRef<CouponDialogComponent>);
  private apiService = inject(ApiService);
  private toast = inject(ToastService);
  private cartService = inject(CartService);

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
      productIds: cartItems.map(i => i.productId)
    };

    this.loading = true;

 this.apiService.applyCoupon(payload).subscribe({
  next: (res: ApplyCouponResponseDto) => {

    // ✅ GUARANTEED STRUCTURE
    const { couponCode, discountAmount } = res.data;

    // 🔥 APPLY COUPON IN CART SERVICE
    this.cartService.applyCoupon(couponCode, discountAmount);

    this.toast.success(`Coupon "${couponCode}" applied 🎉`);
    this.dialogRef.close();
    this.loading = false;
  },
  error: (err) => {
    this.toast.error(err?.error ?? 'Invalid coupon');
    this.loading = false;
  }
});

  }
}
