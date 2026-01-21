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
      this.isLoginPage = event.urlAfterRedirects === '/crm/login';
    });
}

menu: SidebarItem[] = [
  {
    title: 'Dashboard',
    icon: '🏠',
    roles: ['Super Admin', 'Sub Admin Executive'],
    route: '/crm/dashboard'
  },
  {
    title: 'Master',
    icon: '📂',
    roles: ['Super Admin', 'Sub Admin Executive'],
    route: '/crm/master'
  },
  {
    title: 'Orders',
    icon: '📦',
    roles: ['Super Admin'],
    route: '/crm/orders'
  },
  {
    title: 'Users',
    icon: '🧑',
    roles: ['Super Admin'],
    route: '/crm/customers'
  },
  {
    title: 'Employees',
    icon: '🧑',
    roles: ['Super Admin'],
    route: '/crm/employees'
  },
  {
    title: 'Invoice',
    icon: '📄',
    roles: ['Super Admin'],
    route: '/crm/report'
  },
  {
    title: 'Support',
    icon: '📞',
    roles: ['Super Admin'],
    route: '/crm/support'
  },
  {
    title: 'Help',
    icon: '❓',
    roles: ['Super Admin'],
    route: '/crm/help'
  },
  {
    title: 'Settings',
    icon: '⚙️',
    roles: ['Super Admin'],
    route: '/crm/settings'
  }
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
