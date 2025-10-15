import { Routes } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { ClaimDetailsComponent } from './claim-details/claim-details';
import { ClaimFormComponent } from './claim-form/claim-form';
import { RoleGuard } from './guards/role-guard';
import { CategoryFormComponent } from './category-form/category-form';
import { BrandFormComponent } from './brand-form/brand-form';
import { PlanFormComponent } from './plan-form/plan-form';
import { WarrantyFormComponent } from './warranty-form/warranty-form';

export const routes: Routes = [
  { path: '', component: LoginComponent },
  { path: 'dashboard', component: DashboardComponent,  canActivate: [RoleGuard], data: { roles: ['List_all_kits'] }},
  { path: 'login', component: LoginComponent },
  { path: 'claim-details/:claimId', component: ClaimDetailsComponent },
  { path: 'claim-form', component: ClaimFormComponent },
  { path: 'category-form', component: CategoryFormComponent },
  { path: 'brand-form', component: BrandFormComponent },
  { path: 'plan-form', component: PlanFormComponent },
  { path: 'warranty-form', component: WarrantyFormComponent },
];
