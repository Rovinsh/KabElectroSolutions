import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';

export interface CartItem {
  productId: number;
  name: string;
  price: number;
  quantity: number;
  image: string;
}

@Injectable({
  providedIn: 'root'
})
export class CartService {
  private cartItems: CartItem[] = [];
  private cartCount = new BehaviorSubject<number>(0);

  cartCount$ = this.cartCount.asObservable();

  constructor() {}

  addToCart(product: any) {
    const existingItem = this.cartItems.find(item => item.productId === product.id);
    if (existingItem) {
      existingItem.quantity += 1;
    } else {
      this.cartItems.push({
        productId: product.id,
        name: product.name,
        price: product.price,
        quantity: 1,
        image: product.image
      });
    }
    this.updateCartCount();
  }

  removeFromCart(productId: number) {
    this.cartItems = this.cartItems.filter(item => item.productId !== productId);
    this.updateCartCount();
  }

  updateQuantity(productId: number, quantity: number) {
    const item = this.cartItems.find(i => i.productId === productId);
    if (item) {
      item.quantity = quantity;
      if (item.quantity <= 0) {
        this.removeFromCart(productId);
      }
      this.updateCartCount();
    }
  }

  getCartItems(): CartItem[] {
    return this.cartItems;
  }

  private updateCartCount() {
    const totalCount = this.cartItems.reduce((sum, item) => sum + item.quantity, 0);
    this.cartCount.next(totalCount);
  }
}
