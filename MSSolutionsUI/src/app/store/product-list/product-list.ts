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
  selectedCategoryId: number | null = null;
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
    // Load all master data first
    forkJoin({
      categories: this.api.getCategories(),
      products: this.api.getProduct(),
      brands: this.api.getBrands()
    }).subscribe(res => {
      this.categories = res.categories.data.filter(x => x.isDisable);
      this.productList = res.products.data.filter(x => x.isActive);
      this.brands = res.brands.data.filter(x => x.isDisable);

      // Listen to route param changes
      this.route.paramMap.subscribe(params => {
        const id = Number(params.get('id'));
        this.selectedCategoryId = id || null;
        this.applyFilter();
      });
    });
  }

  /* ---------------- FILTER LOGIC ---------------- */

  applyFilter() {
    this.filteredProducts = this.productList.filter(p => {
      const categoryMatch =
        !this.selectedCategoryId || p.categoryId === this.selectedCategoryId;

      const brandMatch =
        this.selectedBrands.size === 0 ||
        this.selectedBrands.has(p.brandId);

      return categoryMatch && brandMatch;
    });
  }

  /* ---------------- CATEGORY ---------------- */

  toggleCategory(event: Event) {
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

  if (checked) {
    // ✅ update state immediately
    this.selectedCategoryId = id;

    // ✅ clear brands when category changes (optional but recommended)
    this.selectedBrands.clear();

    // ✅ apply filter instantly
    this.applyFilter();

    // ✅ sync URL
    this.router.navigate(['/store/productslist', id], {
      replaceUrl: true
    });
  } else {
    this.selectedCategoryId = null;
    this.applyFilter();
    this.router.navigate(['/store/productslist']);
  }
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
