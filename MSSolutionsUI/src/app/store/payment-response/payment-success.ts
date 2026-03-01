import { Component, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule, Router } from '@angular/router';
import { MatDialogModule } from '@angular/material/dialog';
import { CartService } from '../services/cart.service';

@Component({
  selector: 'app-payment-success',
  standalone: true,
  imports: [CommonModule, RouterModule, MatDialogModule],
  templateUrl: './payment-success.html',
  styleUrls: ['./payment-success.css']
})
export class PaymentuScessComponent {

  orderId: number | null = null;
  amount: number | null = null;
   private CartService = inject(CartService);
  constructor(private router: Router) {}

  ngOnInit() {
    const state = history.state;

  if (state && state.orderId) {
    this.orderId = state.orderId;
    this.amount = state.amount;

    this.CartService.clearCart(); // ✅ cart clear here
  }
  }
}