import { Component } from '@angular/core';
import { Router, NavigationEnd } from '@angular/router';
import { filter } from 'rxjs/operators';

@Component({
  selector: 'app-sidebar',
  imports: [],
  templateUrl: './sidebar.component.html',
  styleUrl: './sidebar.component.css'
})
export class SidebarComponent {
isLoginPage = false;

  constructor(private router: Router) {
    this.router.events
      .pipe(filter(event => event instanceof NavigationEnd))
      .subscribe((event: NavigationEnd) => {
        // Hide sidebar ONLY on login route
        this.isLoginPage = event.urlAfterRedirects === '/login';
      });
  }

  goToCreateClaim() {
    this.router.navigate(['/claim-form']);
  }
  goToClaims() {
    this.router.navigate(['/dashboard']);
  }

}
