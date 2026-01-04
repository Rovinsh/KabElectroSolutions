import { Component, Inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Router } from '@angular/router';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { ProductWithImagesDto } from '../../../services/api.service';

@Component({
  selector: 'app-cart-popup',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './cart-popup.component.html'
})
export class CartPopupComponent {

  product!: ProductWithImagesDto;

  constructor(
    private router: Router,
    private dialogRef: MatDialogRef<CartPopupComponent>,
    @Inject(MAT_DIALOG_DATA) public data: ProductWithImagesDto
  ) {
    this.product = data;
  }

  close() {
    this.dialogRef.close();
  }

  goToCart() {
    this.dialogRef.close();
    this.router.navigate(['/store/cart']);
  }

  getProductImage(): string {
    return this.product.images?.length
      ? 'data:image/jpeg;base64,' + this.product.images[0].imageBase64
      : 'assets/no-image.png';
  }

  getFinalPrice(): number {
    return this.product.discountPrice
      ? this.product.baseAmount - this.product.discountPrice
      : this.product.baseAmount;
  }

  getDiscountPercent(): number | null {
    if (!this.product.discountPrice) return null;
    return Math.round((this.product.discountPrice / this.product.baseAmount) * 100);
  }
}
