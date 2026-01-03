import { Injectable } from '@angular/core';

@Injectable({ providedIn: 'root' })
export class CartService {
  private cart: any[] = [];

  getCart() {
    return this.cart;
  }

  add(item: any) {
    const found = this.cart.find(p => p.id === item.id);
    if (found) found.qty += item.qty;
    else this.cart.push(item);
  }

  remove(id: number) {
    this.cart = this.cart.filter(p => p.id !== id);
  }

  updateQty(id: number, qty: number) {
    const item = this.cart.find(p => p.id === id);
    if (item && qty > 0) item.qty = qty;
  }

  total() {
    return this.cart.reduce((sum, i) => sum + i.price * i.qty, 0);
  }
}
