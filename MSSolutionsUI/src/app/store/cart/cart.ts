import { Component, OnInit } from '@angular/core';
import { CartService, CartItem } from '../services/cart.service';

@Component({
  selector: 'app-cart',
  templateUrl: './cart.component.html',
  styleUrls: ['./cart.component.css']
})
export class CartComponent implements OnInit {
  cartItems: CartItem[] = [];
  totalPrice: number = 0;

  constructor(private cartService: CartService) {}

  ngOnInit(): void {
    this.loadCart();
  }

  loadCart() {
    this.cartItems = this.cartService.getCartItems();
    this.calculateTotal();
  }

  removeItem(productId: number) {
    this.cartService.removeFromCart(productId);
    this.loadCart();
  }

  updateQuantity(productId: number, event: any) {
    const quantity = parseInt(event.target.value, 10);
    if (quantity >= 0) {
      this.cartService.updateQuantity(productId, quantity);
      this.loadCart();
    }
  }

  calculateTotal() {
    this.totalPrice = this.cartItems.reduce((sum, item) => sum + item.price * item.quantity, 0);
  }
}
