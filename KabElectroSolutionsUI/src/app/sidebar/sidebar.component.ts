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