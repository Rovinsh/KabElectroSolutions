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
    { title: 'Dashboard', icon: '🏠', roles: ['Super Admin','Sub Admin Executive'], route: '/dashboard' },
    { title: 'Master', icon: '📂', roles: ['Super Admin','Sub Admin Executive'], route: '/master' },
    { title: 'Oders', icon: '📋', roles: ['Super Admin'], route: '/oders' },
    { title: 'Users', icon: '🧑', roles: ['Super Admin'], route: '/user' },
    { title: 'Employees', icon: '🧑', roles: ['Super Admin'], route: '/employees' },
    { title: 'Invoice', icon: '📄', roles: ['Super Admin'], route: '/report' },
    { title: 'Support', icon: '📞', roles: ['Super Admin'], route: '/support' },
    { title: 'Help', icon: '❓', roles: ['Super Admin'], route: '/help' },
    { title: 'Settings', icon: '⚙️', roles: ['Super Admin'], route: '/settings' }
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
