import { Component, inject, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ActivatedRoute, Router, RouterModule } from '@angular/router';
import { MatDialog, MatDialogModule } from '@angular/material/dialog';
import { forkJoin } from 'rxjs';
import { ProductCardComponent } from '../product-card/product-card.component';
import {
  ApiService,
  ProductWithImagesDto,
  CategoryDto,
  BrandDto
} from '../../services/api.service';

import { CartService } from '../services/cart.service';
import { WishlistService } from '../services/wishlist.service';
import { AuthService } from '../../services/auth';
import { ToastService } from '../../services/toastService.service';
import { CartPopupComponent } from '../shared/cart-popup/cart-popup.component';
import { LoginComponent } from '../Login/login.component';

@Component({
  selector: 'app-product-list',
  standalone: true,
  imports: [CommonModule, RouterModule, MatDialogModule,ProductCardComponent],
  templateUrl: './product-list.html',
  styleUrls: ['./product-list.css']
})
export class ProductList implements OnInit {

  // DATA
  categories: CategoryDto[] = [];
  brands: BrandDto[] = [];
  productList: ProductWithImagesDto[] = [];
  filteredProducts: ProductWithImagesDto[] = [];

  // FILTER STATE
 selectedCategoryIds = new Set<number>();
  selectedBrands = new Set<number>();

  // DROPDOWN STATE
  categoryOpen = false;
  brandOpen = false;

  // SERVICES
  private api = inject(ApiService);
  private route = inject(ActivatedRoute);
  private router = inject(Router);
  private dialog = inject(MatDialog);
  private cartService = inject(CartService);
  private wishlistService = inject(WishlistService);
  private auth = inject(AuthService);
  private toast = inject(ToastService);

ngOnInit() {
  const initialCatUrl = this.route.snapshot.paramMap.get('catUrl');
  this.api.getProductList().subscribe({
    next: (res) => {

      const data = res.data;

      // ✅ Safe filtering
      this.categories = (data?.categories ?? [])
        .filter(x => x.isDisable);

      this.productList = (data?.homeProducts ?? [])
        .filter(x => x.isActive);

      this.brands = (data?.brands ?? [])
        .filter(x => x.isDisable);

      // ✅ Category URL matching
      if (initialCatUrl) {
        const matchedCategory = this.categories.find(
          c => c.catUrl === initialCatUrl
        );

        if (matchedCategory) {
          this.selectedCategoryIds.add(matchedCategory.id);
        }
      }

      this.applyFilter();
    },
    error: (err) => {
      console.error('Product list load failed', err);
    }
  });
}

  /* ---------------- FILTER LOGIC ---------------- */

applyFilter() {
  this.filteredProducts = this.productList.filter(p => {

    const categoryMatch =
      this.selectedCategoryIds.size === 0 ||
      this.selectedCategoryIds.has(p.categoryId);

    const brandMatch =
      this.selectedBrands.size === 0 ||
      this.selectedBrands.has(p.brandId);

    return categoryMatch && brandMatch;
  });
}
hasActiveFilters(): boolean {
  return (
    this.selectedCategoryIds.size > 0 ||
    this.selectedBrands.size > 0
  );
}

clearFilters() {
  this.selectedCategoryIds.clear();
  this.selectedBrands.clear();

  this.applyFilter();
}
  /* ---------------- CATEGORY ---------------- */

  toggleCategory(event: Event) {
    event.preventDefault();
    event.stopPropagation();
    this.categoryOpen = !this.categoryOpen;
    this.brandOpen = false;
  }

onCategorySelect(category: CategoryDto, event: Event) {
  const checked = (event.target as HTMLInputElement).checked;

  checked
    ? this.selectedCategoryIds.add(category.id)
    : this.selectedCategoryIds.delete(category.id);

  this.applyFilter();
}
  /* ---------------- BRAND ---------------- */

  toggleBrand(event: Event) {
    event.stopPropagation();
    this.brandOpen = !this.brandOpen;
    this.categoryOpen = false;
  }

  onBrandSelect(id: number, event: Event) {
  const checked = (event.target as HTMLInputElement).checked;

  checked
    ? this.selectedBrands.add(id)
    : this.selectedBrands.delete(id);

  this.applyFilter();
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

  /* ---------------- WISHLIST ---------------- */

  onWishlistClick(productId: number) {
    if (!this.auth.isLoggedIn()) {
      this.openLoginPopup();
      return;
    }
    this.wishlistService.addWishlist(productId);
  }

  private openLoginPopup() {
    this.dialog.open(LoginComponent, {
      width: '700px',
      disableClose: true
    });
  }
}
