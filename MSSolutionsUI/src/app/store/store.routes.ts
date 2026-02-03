import { Routes } from '@angular/router';

export const STORE_ROUTES: Routes = [
  {
    path: 'cart',
    loadComponent: () =>
      import('./cart/cart').then(m => m.CartComponent),
  },
  {
    path: 'product/:id',
    loadComponent: () =>
      import('./product-detail/product-detail')
        .then(m => m.ProductDetailComponent),
  },
  {
    path: 'productList',
    loadComponent: () =>
      import('./product-list/product-list')
        .then(m => m.ProductList),
  },
  {
    path: 'productList/:catUrl',
    loadComponent: () =>
      import('./product-list/product-list')
        .then(m => m.ProductList),
  },
  {
    path: 'wishlist',
    loadComponent: () =>
      import('./wishlist-list/wishlist-list')
        .then(m => m.WishlistList),
  },
  {
    path: 'checkout',
    loadComponent: () =>
      import('./checkout/checkout')
        .then(m => m.CheckoutComponent),
  },
];
