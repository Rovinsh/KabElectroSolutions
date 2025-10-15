import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-header',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent {
  showDropdown = false;

  toggleDropdown() {
    this.showDropdown = !this.showDropdown;
  }
  
  logout() {
    localStorage.clear();
    sessionStorage.clear();
    if (window.location.pathname.includes('/crm')) {
    window.location.href = 'crm/login';
    }else
     window.location.href = 'login';
  }
}
