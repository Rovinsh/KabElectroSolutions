import { Component } from '@angular/core';
import { Router, NavigationEnd } from '@angular/router';
import { filter } from 'rxjs/operators';
import { AuthService } from '../services/auth';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';  // <-- Needed for routerLink

@Component({
  selector: 'app-sidebar',
  standalone: true,
  imports: [CommonModule, RouterModule], // <-- Include RouterModule
  templateUrl: './sidebar.component.html',
  styleUrls: ['./sidebar.component.css']
})
export class SidebarComponent {
  isLoginPage = false;

  constructor(private router: Router, private auth: AuthService) {
    this.router.events
      .pipe(filter(event => event instanceof NavigationEnd))
      .subscribe((event: NavigationEnd) => {
        this.isLoginPage = event.urlAfterRedirects === '/login';
      });
  }

  menu: SidebarItem[] = [
    { title: 'Home', icon: '🏠', roles: ['List_all_kits', 'Create Business'], route: '/dashboard' },
    { title: 'Claims', icon: '📋', roles: ['List_all_kits'], route: '/dashboard' },
    { title: 'Create New Claim', icon: '➕', roles: ['Create Business'], route: '/claim-form' },
    { title: 'Master', icon: '📂', roles: ['Create Business'], route: '/master' },
    { title: 'Report', icon: '📄', roles: ['Create Business'], route: '/report' },
    { title: 'Warranties', icon: '🛡️', roles: ['Create Business'], route: '/warranties' },
    { title: 'Support', icon: '📞', roles: ['Service Centre'], route: '/support' },
    { title: 'Help', icon: '❓', roles: [], route: '/help' },
    { title: 'Settings', icon: '⚙️', roles: ['List_all_kits'], route: '/settings' }
  ];

  hasAccess(item: SidebarItem): boolean {
    return item.roles.length === 0 || item.roles.some(r => this.auth.getRoles().includes(r));
  }
}

interface SidebarItem {
  title: string;
  icon: string;
  roles: string[];
  route: string;
}
