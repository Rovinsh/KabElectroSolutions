import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Router } from '@angular/router';
import { CartService } from '../services/cart.service';

@Component({
  selector: 'app-cart',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './cart.component.html',
  styleUrls: ['./cart.component.css']
})
export class CartComponent implements OnInit {

  cart: any[] = [];

  constructor(private cartService: CartService, private router: Router) {}

  ngOnInit() {
    this.cart = this.cartService.getCart();
  }

  remove(id: number) {
    this.cartService.remove(id);
    this.cart = this.cartService.getCart();
  }

  update(id: number, qty: number) {
    this.cartService.updateQty(id, qty);
  }

  checkout() {
    this.router.navigate(['/store/checkout']);
  }

  total() {
    return this.cartService.total();
  }
}
