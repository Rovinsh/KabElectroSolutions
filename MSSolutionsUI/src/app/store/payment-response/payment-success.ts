import { Component, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule, Router } from '@angular/router';
import { MatDialogModule } from '@angular/material/dialog';
import { CartService } from '../services/cart.service';
import { ApiService, OrderDTO } from '../../services/api.service';
import { InvoiceService } from '../../services/invoice.service';
@Component({
  selector: 'app-payment-success',
  standalone: true,
  imports: [CommonModule, RouterModule, MatDialogModule],
  templateUrl: './payment-success.html',
  styleUrls: ['./payment-success.css']
})
export class PaymentuScessComponent {
  orderId!: string;
  amount: number | null = null;
   private CartService = inject(CartService);
  constructor(private router: Router,private apiService: ApiService,private invoiceService: InvoiceService) {}

  ngOnInit() {
    const state = history.state;

  if (state && state.orderId) {
    this.orderId = state.orderId;
    this.amount = state.amount;
    this.orderId = state.orderId;

    this.CartService.clearCart(); // ✅ cart clear here
  }
  }
  downloadInvoice() {
  this.apiService.getOrderById(this.orderId).subscribe({
    next: (order) => {
      this.invoiceService.generateInvoice(order);
    },
    error: (err) => {
      console.error("Invoice fetch failed", err);
    }
  });
}

}