import { Component, OnInit, OnDestroy } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Subscription } from 'rxjs';
import { CartItem, CartService } from '../services/cart.service';

@Component({
  selector: 'app-cart',
  standalone: true,
  imports: [CommonModule],   // ✅ REQUIRED
  templateUrl: './cart.html',
  styleUrls: ['./cart.css']
})
export class CartComponent implements OnInit, OnDestroy {

  cartItems: CartItem[] = [];
  total = 0;
  private sub?: Subscription;

  constructor(private cartService: CartService) {}

  ngOnInit(): void {
    this.sub = this.cartService.cartItems$.subscribe(items => {
      this.cartItems = items;
      this.total = items.reduce(
        (sum, item) => sum + item.price * item.quantity,
        0
      );
    });
  }

  ngOnDestroy(): void {
    this.sub?.unsubscribe();
  }

  remove(id: number) {
    this.cartService.removeFromCart(id);
  }
}
