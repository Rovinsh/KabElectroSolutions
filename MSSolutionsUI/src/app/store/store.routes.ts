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
  {
    path: 'privacy_policy',
    loadComponent: () =>
      import('./privacy-policy/privacy_policy')
        .then(m => m.PrivacyPolicyComponent),
  },
  {
    path: 'term_condition',
    loadComponent: () =>
      import('./term_condition/term_condition')
        .then(m => m.TermConditionComponent),
  },
{
    path: 'refund_policy',
    loadComponent: () =>
      import('./refund_policy/refund_policy')
        .then(m => m.RefundPolicyComponent),
  },
  {
    path: 'return_policy',
    loadComponent: () =>
      import('./return_policy/return_policy')
        .then(m => m.ReturnPolicyComponent),
  },
  {
    path: 'shipping_policy',
    loadComponent: () =>
      import('./shipping_policy/shipping_policy')
        .then(m => m.ShippingPolicyComponent),
  }
];
