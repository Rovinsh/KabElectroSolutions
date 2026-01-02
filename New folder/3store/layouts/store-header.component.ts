import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';

@Component({
  selector: 'app-store-header',
  standalone: true,
  imports: [CommonModule, RouterModule],
  templateUrl: './store-header.component.html',
  styleUrls: ['./store-header.component.css']
})
export class StoreHeaderComponent {
  cartCount = 0;

  logout() {
    localStorage.removeItem('token');
    location.href = '/store/login';
  }
}
