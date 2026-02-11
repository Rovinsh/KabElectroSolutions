import { Routes } from '@angular/router';
import { AdminLayout } from './layouts/admin-layout';
import { StoreLayout } from './layouts/store-layout';
import { LoginComponent } from './login/login.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { RoleGuard } from './guards/role-guard';
import { OrderComponent } from './orders/orders';
import { CustomerComponent } from './customer/customer';
import { MasterComponent } from '../app/master/master';
import { UserComponent } from './user/user';
import { ReportComponent } from './report/report';

export const routes: Routes = [
  {
    path: '',
    component: StoreLayout,
    children: [
      {
        path: '',
        loadComponent: () =>
          import('./store/home/home').then(m => m.HomeComponent),
      },
      {
        path: 'store',
        loadChildren: () =>
          import('./store/store.routes').then(m => m.STORE_ROUTES),
      }
    ]
  },

 {
    path: 'crm',
    component: AdminLayout,
    children: [
      { path: '', redirectTo: 'login', pathMatch: 'full' },

      { path: 'login', component: LoginComponent },

      {
        path: 'dashboard',
        component: DashboardComponent,
        canActivate: [RoleGuard],
        data: { roles: ['Super Admin', 'Sub Admin Executive'] }
      },
      {
        path: 'orders',
        component: OrderComponent,
        canActivate: [RoleGuard],
        data: { roles: ['Super Admin'] }
      },
      {
        path: 'employees',
        component: UserComponent,
        canActivate: [RoleGuard],
        data: { roles: ['Super Admin'] }
      },
      {
        path: 'users',
        component: CustomerComponent,
        canActivate: [RoleGuard],
        data: { roles: ['Super Admin'] }
      },
      {
        path: 'master',
        component: MasterComponent,
        canActivate: [RoleGuard],
        data: { roles: ['Super Admin'] }
      },
      {
        path: 'report',
        component: ReportComponent,
        canActivate: [RoleGuard],
        data: { roles: ['Super Admin'] }
      }
    ]
  },

  /* ================= FALLBACK ================= */
  { path: '**', redirectTo: '' }
];