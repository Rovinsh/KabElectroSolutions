import { Routes } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { ClaimDetailsComponent } from './claim-details/claim-details';
import { ClaimFormComponent } from './claim-form/claim-form';
import { RoleGuard } from './guards/role-guard';
import { WarrantyFormComponent } from './warranty-form/warranty-form';
import { MasterComponent } from '../app/master/master';

export const routes: Routes = [
  { path: '', component: LoginComponent },
  { path: 'dashboard', component: DashboardComponent,  canActivate: [RoleGuard], data: { roles: ['List_all_kits'] }},
  { path: 'login', component: LoginComponent },
  { path: 'claim-details/:claimId', component: ClaimDetailsComponent },
  { path: 'claim-form', component: ClaimFormComponent },
  { path: 'master', component: MasterComponent },
  { path: 'warranty-form', component: WarrantyFormComponent },
];
