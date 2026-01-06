import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { ProductWithImagesDto } from '../../services/api.service';

export interface CartItem {
  productId: number;
  name: string;
  price: number;
  quantity: number;
  image: string;
}

const CART_KEY = 'APP_CART_ITEMS_V1';

@Injectable({ providedIn: 'root' })
export class CartService {
  private cartItemsSubject = new BehaviorSubject<CartItem[]>(this.loadFromStorage());
  cartItems$ = this.cartItemsSubject.asObservable();

  private cartCountSubject = new BehaviorSubject<number>(this.calcCount(this.cartItemsSubject.value));
  cartCount$ = this.cartCountSubject.asObservable();

  constructor() {}

  addToCart(product: ProductWithImagesDto) {
    const items = [...this.cartItemsSubject.value];

    const productId = product.id;         // ✅ DTO field
    const name = product.productName;            // ✅ DTO field
    const price = this.getFinalPrice(product);   // ✅ final price
    const image = this.getPrimaryImage(product); // ✅ base64 or fallback

    const existing = items.find(x => x.productId === productId);

    if (existing) {
      existing.quantity += 1;
    } else {
      items.push({ productId, name, price, quantity: 1, image });
    }

    this.setState(items);
  }

  removeFromCart(productId: number) {
    const items = this.cartItemsSubject.value.filter(x => x.productId !== productId);
    this.setState(items);
  }

  updateQuantity(productId: number, quantity: number) {
    const items = [...this.cartItemsSubject.value];
    const item = items.find(x => x.productId === productId);
    if (!item) return;

    if (quantity <= 0) {
      this.removeFromCart(productId);
      return;
    }

    item.quantity = quantity;
    this.setState(items);
  }

  clearCart() {
    this.setState([]);
  }

  // ---------- helpers ----------
  private setState(items: CartItem[]) {
    this.cartItemsSubject.next(items);
    this.cartCountSubject.next(this.calcCount(items));
    this.saveToStorage(items);
  }

  private calcCount(items: CartItem[]) {
    return items.reduce((sum, i) => sum + i.quantity, 0);
  }

  private saveToStorage(items: CartItem[]) {
    try {
      localStorage.setItem(CART_KEY, JSON.stringify(items));
    } catch (e) {
      console.error('Failed to save cart to localStorage', e);
    }
  }

  private loadFromStorage(): CartItem[] {
    try {
      const raw = localStorage.getItem(CART_KEY);
      if (!raw) return [];
      const parsed = JSON.parse(raw);
      return Array.isArray(parsed) ? parsed : [];
    } catch (e) {
      console.warn('Cart localStorage corrupted. Resetting.', e);
      localStorage.removeItem(CART_KEY);
      return [];
    }
  }

  private getFinalPrice(product: ProductWithImagesDto): number {
    // ✅ your logic: baseAmount - discountPrice
    return product.discountPrice
      ? product.baseAmount - product.discountPrice
      : product.baseAmount;
  }

  private getPrimaryImage(product: ProductWithImagesDto): string {
    return product.images?.length
      ? 'data:image/jpeg;base64,' + product.images[0].imageBase64
      : 'assets/no-image.png';
  }
}
