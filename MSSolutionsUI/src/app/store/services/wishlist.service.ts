import { Injectable, inject } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { ApiService } from '../../services/api.service';
import { ToastService } from '../../services/toastService.service';

@Injectable({ providedIn: 'root' })
export class WishlistService {
  private apiService = inject(ApiService);
  private toast = inject(ToastService);

  private _wishlistIds = new BehaviorSubject<Set<number>>(new Set());
  wishlistIds$ = this._wishlistIds.asObservable();

  loadWishlist() {
    this.apiService.getWishlist().subscribe({
      next: res => {
        const ids = res?.data?.map((item: any) => item.productId ?? item.ProductId) ?? [];
        this._wishlistIds.next(new Set(ids));
      },
      error: () => this._wishlistIds.next(new Set())
    });
  }

  isInWishlist(productId: number): boolean {
    return this._wishlistIds.value.has(productId);
  }

  addWishlist(productId: number) {
    this.apiService.addWishlist(productId).subscribe({
      next: () => {
        const updated = new Set(this._wishlistIds.value);
        updated.add(productId);
        this._wishlistIds.next(updated);
        this.toast.success('Added to wishlist ❤️');
      },
      error: err => {
        if (err.status === 409) this.toast.info('Already in wishlist');
        else this.toast.error('Failed to add wishlist');
      }
    });
  }

  clearWishlist() {
    this._wishlistIds.next(new Set());
  }
removeWishlist(productId: number) {
  this.apiService.removeWishlist(productId).subscribe({
    next: () => {
      const updated = new Set(this._wishlistIds.value);
      updated.delete(productId);
      this._wishlistIds.next(updated);
      this.toast.success('Removed from wishlist');
    },
    error: () => {
      this.toast.error('Failed to remove from wishlist');
    }
  });
}
restoreWishlist() {
  if (!localStorage.getItem('token')) {
    this._wishlistIds.next(new Set());
    return;
  }

  this.apiService.getWishlist().subscribe({
    next: res => {
      const ids = res?.data?.map((x: any) => x.productId ?? x.ProductId) ?? [];
      this._wishlistIds.next(new Set(ids));
    },
    error: () => this._wishlistIds.next(new Set())
  });
}
}
