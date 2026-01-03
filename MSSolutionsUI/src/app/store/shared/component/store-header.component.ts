import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { CartService } from '../../services/cart.service';
@Component({
  selector: 'app-store-header',
  standalone: true,
  imports: [CommonModule, RouterModule],
  templateUrl: './store-header.component.html',
  styleUrls: ['./store-header.component.css']
})
export class StoreHeaderComponent {
  cartCount = 0;
   constructor(private cartService: CartService) {}
showUserMenu = false;
  logout() {
    localStorage.removeItem('token');
    location.href = '/store/login';
  }
    ngOnInit(): void {
    this.cartService.cartCount$.subscribe(count => {
      this.cartCount = count;
    });
  }
}
