import { Component, inject, OnInit, OnDestroy } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { MatDialog, MatDialogModule } from '@angular/material/dialog';
import { Subscription } from 'rxjs';

import {
  ApiService,
  ProductWithImagesDto
} from '../../services/api.service';

import { CartService } from '../services/cart.service';
import { WishlistService } from '../services/wishlist.service';
import { ToastService } from '../../services/toastService.service';
import { CartPopupComponent } from '../shared/cart-popup/cart-popup.component';

@Component({
  selector: 'app-wishlist-list',
  standalone: true,
  imports: [CommonModule, RouterModule, MatDialogModule],
  templateUrl: './wishlist-list.html',
  styleUrls: ['./wishlist-list.css']
})
export class WishlistList implements OnInit, OnDestroy {

  allProducts: ProductWithImagesDto[] = [];
  wishlistProducts: ProductWithImagesDto[] = [];

  private api = inject(ApiService);
  private dialog = inject(MatDialog);
  private cartService = inject(CartService);
  private wishlistService = inject(WishlistService);
  private toast = inject(ToastService);

  private sub = new Subscription();

  ngOnInit(): void {
    this.loadProducts();
    this.listenWishlistChanges();
  }

  ngOnDestroy() {
    this.sub.unsubscribe();
  }

  /* ---------------- LOAD PRODUCTS ---------------- */

  loadProducts() {
    this.api.getProduct().subscribe(res => {
      this.allProducts = res.data.filter(x => x.isActive);
      this.filterWishlist();
    });
  }

  /* ---------------- WISHLIST FILTER ---------------- */

  listenWishlistChanges() {
    this.sub.add(
      this.wishlistService.wishlistIds$.subscribe(() => {
        this.filterWishlist();
      })
    );
  }

  filterWishlist() {
    const wishlistIds = this.wishlistService['_wishlistIds'].value;

    this.wishlistProducts = this.allProducts.filter(p =>
      wishlistIds.has(p.id)
    );
  }

  /* ---------------- UI HELPERS ---------------- */

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

  /* ---------------- CART ---------------- */

  addToCart(product: ProductWithImagesDto) {
    this.cartService.addToCart(product);
    this.dialog.open(CartPopupComponent, {
      width: '500px',
      disableClose: true,
      data: product
    });
  }

  /* ---------------- REMOVE WISHLIST ---------------- */

  removeWhishList(productId: number) {
    this.wishlistService.removeWishlist(productId);
  }
}
