import { Routes } from '@angular/router';
import { StoreLayout } from '../layouts/store-layout';

export const STORE_ROUTES: Routes = [
  {
    path: '',
    component: StoreLayout,
    children: [
      {
        path: '',
        loadComponent: () =>
          import('./home/home').then(m => m.HomeComponent),
      },
        {
        path: 'cart',
        loadComponent: () =>
          import('./cart/cart').then(m => m.CartComponent),
      },
      {
        path: 'product/:id',
        loadComponent: () =>
          import('./product-detail/product-detail').then(m => m.ProductDetailComponent),
      },
     {
        path: 'productList/:id',
        loadComponent: () =>
          import('./product-list/product-list')
            .then(pl => pl.ProductList),
      },
     {
        path: 'productList',
        loadComponent: () =>
          import('./product-list/product-list')
            .then(pl => pl.ProductList),
      },
      {
        path: 'wishlist',
        loadComponent: () =>
          import('./wishlist-list/wishlist-list')
            .then(pl => pl.WishlistList),
      },
      {
        path: 'checkout',
        loadComponent: () =>
          import('./checkout/checkout').then(m => m.CheckoutComponent),
      },
      // {
      //   path: 'products',
      //   loadComponent: () =>
      //     import('./products/product').then(m => m.ProductListComponent),
      // },
      // {
      //   path: 'product/:id',
      //   loadComponent: () =>
      //     import('./product-detail/product-detail').then(m => m.ProductDetailComponent),
      // },
      // {
      //   path: 'checkout',
      //   loadComponent: () =>
      //     import('./checkout/checkout').then(m => m.CheckoutComponent),
      //   // canActivate: [AuthGuard]
      // },
      // {
      //   path: 'register',
      //   loadComponent: () =>
      //     import('./auth/register').then(m => m.RegisterComponent),
      // },
      // {
      //   path: 'login',
      //   loadComponent: () =>
      //     import('./auth/login').then(m => m.LoginComponent),
      // },
      // {
      //   path: 'order-confirmation',
      //   loadComponent: () =>
      //     import('./pages/order-confirmation/order-confirmation').then(
      //       m => m.OrderConfirmationComponent
      //     ),
      // },
    ],
  },
];
