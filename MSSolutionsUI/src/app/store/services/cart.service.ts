import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { ProductWithImagesDto } from '../../services/api.service';

export interface CartItem {
  productId: number;
  name: string;
  basePrice: number;
  discountPrice: number;
  price: number;        // base - discount
  gstPercent: number;
  quantity: number;
  image: string;

  // calculated later (optional)
  couponDiscount?: number;
  gstAmount?: number;
  finalAmount?: number;
}
const CART_KEY = 'APP_CART_ITEMS_V1';

@Injectable({ providedIn: 'root' })
export class CartService {
  private cartItemsSubject = new BehaviorSubject<CartItem[]>(this.loadFromStorage());
  cartItems$ = this.cartItemsSubject.asObservable();

  private cartCountSubject = new BehaviorSubject<number>(
    this.calcCount(this.cartItemsSubject.value)
  );
  cartCount$ = this.cartCountSubject.asObservable();
 private couponDiscount = 0;
  public couponCode = '';
  constructor() {
     this.recalculatePrices();
  }

addToCart(product: ProductWithImagesDto) {
    const items = [...this.cartItemsSubject.value];

    const basePrice = Number(product.baseAmount || 0);
    const discountPrice = Number(product.discountPrice || 0);
    const price = Math.max(basePrice - discountPrice, 0);

    const newItem: CartItem = {
      productId: product.id,
      name: product.productName,
      basePrice,
      discountPrice,
      price,
      gstPercent: Number(product.gstPercentage || 0),
      quantity: 1,
      image: this.getPrimaryImage(product)
    };

    items.push(newItem);
    this.setState(items);
  }

  // ================= REMOVE =================
  removeFromCart(productId: number) {
    const items = this.cartItemsSubject.value.filter(x => x.productId !== productId);
    this.setState(items);
  }

  // ================= UPDATE QTY =================
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

  // ================= APPLY COUPON =================
  applyCoupon(code: string, discountAmount: number) {
    this.couponCode = code;
    this.couponDiscount = discountAmount;
    this.recalculatePrices();
  }

  clearCoupon() {
    this.couponCode = '';
    this.couponDiscount = 0;
    this.recalculatePrices();
  }

  // ================= PRICE LOGIC (🔥 CORE) =================
  private recalculatePrices() {
    const items = [...this.cartItemsSubject.value];

    const subtotal = items.reduce(
      (sum, i) => sum + i.price * i.quantity,
      0
    );

    const updated = items.map(item => {
      const itemTotal = item.price * item.quantity;

      // coupon distribution
      const couponShare =
        subtotal > 0 ? (itemTotal / subtotal) * this.couponDiscount : 0;

      const discountedUnitPrice =
        item.price - couponShare / item.quantity;

      const gstAmount =
        +(discountedUnitPrice * item.gstPercent / 100).toFixed(2);

      return {
        ...item,
        couponDiscount: +couponShare.toFixed(2),
        gstAmount,
        finalAmount: +(discountedUnitPrice + gstAmount).toFixed(2)
      };
    });

    this.cartItemsSubject.next(updated);
    this.cartCountSubject.next(this.calcCount(updated));
    this.saveToStorage(updated);
  }

  // ================= HELPERS =================
  private setState(items: CartItem[]) {
    this.cartItemsSubject.next(items);
    this.cartCountSubject.next(this.calcCount(items));
    this.saveToStorage(items);
    this.recalculatePrices();
  }

  private calcCount(items: CartItem[]) {
    return items.reduce((sum, i) => sum + i.quantity, 0);
  }

  private saveToStorage(items: CartItem[]) {
    localStorage.setItem(CART_KEY, JSON.stringify(items));
  }

  private loadFromStorage(): CartItem[] {
    try {
      const raw = localStorage.getItem(CART_KEY);
      return raw ? JSON.parse(raw) : [];
    } catch {
      localStorage.removeItem(CART_KEY);
      return [];
    }
  }

  private getPrimaryImage(product: ProductWithImagesDto): string {
    return product.images?.length
      ? 'data:image/jpeg;base64,' + product.images[0].imageBase64
      : 'assets/no-image.png';
  }

  private getFinalPrice(product: ProductWithImagesDto): number {
    // ✅ your logic: baseAmount - discountPrice
    return product.discountPrice
      ? product.baseAmount - product.discountPrice
      : product.baseAmount;
  }

 private getFinalWithPrice(product: ProductWithImagesDto): number {
  const base = Number(product.baseAmount || 0);
  const discount = Number(product.discountPrice || 0);
  const gstPercent = Number(product.gstPercentage || 0);

  // 1️⃣ Taxable amount (after discount)
  const taxableAmount = Math.max(base - discount, 0);

  // 2️⃣ GST calculation
  const gstAmount = +(taxableAmount * gstPercent / 100).toFixed(2);

  // 3️⃣ Final price (with GST)
  const finalPrice = +(taxableAmount + gstAmount).toFixed(2);

  return finalPrice;
}
getCartItems(): CartItem[] {
  return this.cartItemsSubject.value;
}
}
