import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { ClaimDetailsComponent } from './claim-details/claim-details';
import { ClaimFormComponent } from './claim-form/claim-form';
import { RoleGuard } from './guards/role-guard';
import { MasterComponent } from '../app/master/master';
import { ReportComponent } from '../app/report/report';
import { Warranties } from './warranties/warranties';
import { UserComponent } from './user/user';
export const routes: Routes = [
  { path: '', component: LoginComponent },
  { path: 'crm/login', component: LoginComponent },
  { path: 'dashboard', component: DashboardComponent,  canActivate: [RoleGuard], data: { roles: ['List_all_kits','Create Business'] }},
  { path: 'login', component: LoginComponent },
  { path: 'claim-details/:claimId', component: ClaimDetailsComponent },
  { path: 'claim-form', component: ClaimFormComponent },
  { path: 'user', component: UserComponent },
  { path: 'master', component: MasterComponent },
  { path: 'report', component: ReportComponent },
  { path: 'warranties', component: Warranties },
];

