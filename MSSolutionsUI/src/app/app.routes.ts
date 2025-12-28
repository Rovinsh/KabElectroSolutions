import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { OrderComponent } from './orders/orders';
import { CustomerComponent } from './customer/customer';
import { RoleGuard } from './guards/role-guard';
import { MasterComponent } from '../app/master/master';
import { ReportComponent } from '../app/report/report';
import { UserComponent } from './user/user';
export const routes: Routes = [
  { path: '', component: LoginComponent },
  { path: 'crm/login', component: LoginComponent },
  { path: 'dashboard', component: DashboardComponent, canActivate: [RoleGuard], data: { roles: ['Super Admin', 'Sub Admin Executive'] }},
  { path: 'login', component: LoginComponent },
  { path: 'oders', component: OrderComponent, canActivate: [RoleGuard], data: { roles: ['Super Admin'] } },
  { path: 'employees', component: UserComponent, canActivate: [RoleGuard], data: { roles: ['Super Admin'] } },
  { path: 'user', component:CustomerComponent, canActivate: [RoleGuard], data: { roles: ['Super Admin'] } },
  { path: 'master', component: MasterComponent,canActivate: [RoleGuard], data: { roles: ['Super Admin'] }} ,
  { path: 'report', component: ReportComponent, canActivate: [RoleGuard], data: { roles: ['Super Admin'] }},
];

 