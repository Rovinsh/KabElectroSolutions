import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { ClaimDetailsComponent } from './claim-details/claim-details';
import { AssignClaim } from './assign-claim/assign-claim';
import { ClaimFormComponent } from './claim-form/claim-form';
import { RoleGuard } from './guards/role-guard';
import { MasterComponent } from '../app/master/master';
import { ReportComponent } from '../app/report/report';
import { Warranties } from './warranties/warranties';
import { UserComponent } from './user/user';
export const routes: Routes = [
  { path: '', component: LoginComponent },
  { path: 'crm/login', component: LoginComponent },
  { path: 'dashboard', component: DashboardComponent, canActivate: [RoleGuard], data: { roles: ['Super Admin', 'Service Centre','Brand','Customer Care Executive'] }},
  { path: 'login', component: LoginComponent },
  { path: 'claim-details/:claimId', component: ClaimDetailsComponent, canActivate: [RoleGuard], data: { roles: ['Super Admin', 'Service Centre','Brand','Customer Care Executive'] } },
  { path: 'claim-form', component: ClaimFormComponent, canActivate: [RoleGuard], data: { roles: ['Super Admin'] }},
  { path: 'brand-claim-form', component: ClaimFormComponent, canActivate: [RoleGuard], data: { roles: ['Super Admin', 'Brand'] }},
  { path: 'assign-claim', component: AssignClaim, canActivate: [RoleGuard], data: { roles: ['Super Admin'] } },
  { path: 'user', component: UserComponent, canActivate: [RoleGuard], data: { roles: ['Super Admin'] } },
  { path: 'master', component: MasterComponent,canActivate: [RoleGuard], data: { roles: ['Super Admin'] }} ,
  { path: 'report', component: ReportComponent, canActivate: [RoleGuard], data: { roles: ['Super Admin', 'Service Centre','Brand','Customer Care Executive'] }},
  { path: 'warranties', component: Warranties, canActivate: [RoleGuard], data: { roles: ['Super Admin'] }},
];

