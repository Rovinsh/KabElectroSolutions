import { Component } from '@angular/core';
import { NavigationEnd, Router, RouterOutlet } from '@angular/router';
import { HeaderComponent } from '../header/header.component';
import { SidebarComponent } from '../sidebar/sidebar.component';
import { filter } from 'rxjs';

@Component({
  selector: 'app-admin-layout',
  standalone: true,
  imports: [RouterOutlet, HeaderComponent, SidebarComponent],
  templateUrl: './admin-layout.html',
})
export class AdminLayout {
    isLoginPage = false;
     protected title = 'KabElectroSolutions';
    
      constructor(private router: Router) {
        this.router.events
          .pipe(filter(event => event instanceof NavigationEnd))
          .subscribe((event: any) => {
            const url = event.urlAfterRedirects;
            // hide header & sidebar only if route is login
            this.isLoginPage = url.includes('/login') || url == "/";
          });
      }
}