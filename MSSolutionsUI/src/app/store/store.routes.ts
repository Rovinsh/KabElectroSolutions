import { Routes } from '@angular/router';

export const STORE_ROUTES: Routes = [
  {
    path: 'cart',
    loadComponent: () =>
      import('./cart/cart').then(m => m.CartComponent),
  },
  {
    path: 'product/:productUrl',
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
    path: 'profile',
    loadComponent: () =>
      import('./user-profile/user-profile')
        .then(m => m.UserProfile),
  },
   {
    path: 'address',
    loadComponent: () =>
      import('./user-addressList/user-addressList')
        .then(m => m.UserAddress),
  },
   {
    path: 'orders',
    loadComponent: () =>
      import('./user-ordersList/user-ordersList')
        .then(m => m.UserOrders),
  },
  {
    path: 'checkout',
    loadComponent: () =>
      import('./checkout/checkout')
        .then(m => m.CheckoutComponent),
  },
];
