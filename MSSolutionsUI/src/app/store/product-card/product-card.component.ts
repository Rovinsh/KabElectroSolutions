import { Component, inject, Input, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { CartService } from '../services/cart.service';
import { ProductWithImagesDto } from '../../services/api.service';
import { AuthService } from '../../services/auth';
import { CartPopupComponent } from '../shared/cart-popup/cart-popup.component';
import { LoginComponent } from '../Login/login.component';
import { MatDialog, MatDialogModule } from '@angular/material/dialog';
import { RouterModule } from '@angular/router';
import { WishlistService } from '../services/wishlist.service';

@Component({
  selector: 'app-product-card',
  standalone: true,
  imports: [CommonModule, MatDialogModule, RouterModule],
  templateUrl: './product-card.component.html',
  styleUrls: ['./product-card.component.css']
})
export class ProductCardComponent implements OnInit {

  @Input() product!: ProductWithImagesDto;

  wishlistIds: Set<number> = new Set();
  pendingWishlistProductId: number | null = null;

  private wishlistService = inject(WishlistService);
  private auth = inject(AuthService);
  private dialog = inject(MatDialog);
  private cartService = inject(CartService);

  ngOnInit(): void {
    this.wishlistService.wishlistIds$.subscribe(ids => {
    this.wishlistIds = ids;
    });
  }

  isInWishlist(productId: number): boolean {
    return this.wishlistService.isInWishlist(productId);
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

  addToCart(product: ProductWithImagesDto) {
    this.cartService.addToCart(product);
    this.dialog.open(CartPopupComponent, {
      width: '500px',
      maxWidth: '95vw',
      disableClose: true,
      data: product
    });
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
}
