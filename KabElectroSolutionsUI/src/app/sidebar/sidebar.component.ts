import { Component } from '@angular/core';
import { Router, NavigationEnd } from '@angular/router';
import { filter } from 'rxjs/operators';
import { AuthService } from '../services/auth';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-sidebar',
  imports: [CommonModule],
  templateUrl: './sidebar.component.html',
  styleUrl: './sidebar.component.css'
})
export class SidebarComponent {
isLoginPage = false;

  constructor(private router: Router,private auth: AuthService) {
    this.router.events
      .pipe(filter(event => event instanceof NavigationEnd))
      .subscribe((event: NavigationEnd) => {
        // Hide sidebar ONLY on login route
        this.isLoginPage = event.urlAfterRedirects === '/login';
      });
  }

menu: SidebarItem[] = [
    { title: 'Home', icon: '🏠', roles: ['List_all_kits', 'Create Business'], action: () => this.goToClaims() },
    { title: 'Claims', icon: '📋', roles: ['List_all_kits'], action: () => this.goToClaims() },
    { title: 'Create New Claim', icon: '➕', roles: ['Create Business'], action: () => this.goToCreateClaim() },
    { title: 'Create New Categories', icon: '🗂️', roles: ['Create Business'], action: () => this.goToCategories() },
    { title: 'Create New Brands', icon: '🧾', roles: ['Create Business'], action: () => this.goToBrands() },
    { title: 'Create New Plan', icon: '🛍️', roles: ['Create Business'], action: () => this.goToPlan() },
    { title: 'Create New Warranty', icon: '🛡️', roles: ['Create Business'], action: () => this.goToCreateWarranty() },
    { title: 'Support', icon: '📞', roles: ['Service Centre'] },
    { title: 'Help', icon: '❓', roles: [] },       // visible to everyone
    { title: 'Settings', icon: '⚙️', roles: ['List_all_kits'] }
  ];

  goToCreateClaim() {
    this.router.navigate(['/claim-form']);
  }
  goToClaims() {
    this.router.navigate(['/dashboard']);
  }
  goToCategories() {
    this.router.navigate(['/category-form']);
  }

  goToBrands() {
    this.router.navigate(['/brand-form']);
  }

  goToPlan() {
    this.router.navigate(['/plan-form']);
  }

  goToCreateWarranty() {
    this.router.navigate(['/warranty-form']);
  }

  hasAccess(item: SidebarItem): boolean {
    return item.roles.length === 0 || item.roles.some(r => this.auth.getRoles().includes(r));
  }
}
interface SidebarItem {
  title: string;
  icon: string;
  roles: string[];        // Allowed roles
  action?: () => void;    // Optional click handler
}
