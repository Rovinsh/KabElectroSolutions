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

ngOnInit(): void {

  const initialCategoryId = Number(
    this.route.snapshot.paramMap.get('id')
  );

  forkJoin({
    categories: this.api.getCategories(),
    products: this.api.getProduct(),
    brands: this.api.getBrands()
  }).subscribe(res => {

    this.categories = res.categories.data.filter(x => x.isDisable);
    this.productList = res.products.data.filter(x => x.isActive);
    this.brands = res.brands.data.filter(x => x.isDisable);

    // 🔥 seed from route (single category)
    if (initialCategoryId) {
      this.selectedCategoryIds.add(initialCategoryId);
    }

    this.applyFilter();
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

  // onCategorySelect(id: number, event: Event) {
  //   const checked = (event.target as HTMLInputElement).checked;

  //   if (checked) {
  //     this.router.navigate(['/store/productslist', id]);
  //   } else {
  //     this.router.navigate(['/store/productslist']);
  //   }
  // }
onCategorySelect(id: number, event: Event) {
  const checked = (event.target as HTMLInputElement).checked;

  checked
    ? this.selectedCategoryIds.add(id)
    : this.selectedCategoryIds.delete(id);

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
