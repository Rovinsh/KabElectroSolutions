import { Component, Input } from '@angular/core';
import { CommonModule } from '@angular/common';
import { CartService } from '../services/cart.service';
import { ProductWithImagesDto } from '../../services/api.service';
import { CartPopupComponent } from '../shared/cart-popup/cart-popup.component';
import { MatDialog, MatDialogModule } from '@angular/material/dialog';
import { RouterModule } from '@angular/router';
@Component({
  selector: 'app-product-card',
  standalone: true,
  imports: [CommonModule,MatDialogModule,RouterModule],
  templateUrl: './product-card.component.html',
  styleUrls: ['./product-card.component.css']
})
export class ProductCardComponent {

  showCartPopup = false;
  popupProductName = '';
  popupPrice = 0;
  popupImage = '';

   @Input() product!: ProductWithImagesDto;
    constructor(private dialog: MatDialog,private cartService: CartService) {
    }

  ngOnChanges() {
    console.log('Product received:', this.product);
    console.log('Product name:', this.product?.productName);
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
}
