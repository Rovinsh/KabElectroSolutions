import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { CartService } from '../services/cart.service';
import { ApiService } from '../../services/api.service';

@Component({
  selector: 'app-checkout',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './checkout.component.html',
  styleUrls: ['./checkout.component.css']
})
export class CheckoutComponent implements OnInit {

  cart: any[] = [];
  total = 0;

  billing = { fullName: '', phone: '', addressLine: '', city: '', state: '', pincode: '' };
  shipping = { fullName: '', phone: '', addressLine: '', city: '', state: '', pincode: '', country: 'India' };

  constructor(private cartService: CartService, private api: ApiService, private router: Router) {}

  ngOnInit() {
    this.cart = this.cartService.getCart();
    this.total = this.cartService.total();
  }

  placeOrder() {
    const payload = {
      userId: 1,
      subTotal: this.total,
      grandTotal: this.total,
      orderDetails: this.cart.map(i => ({
        productId: i.id,
        quantity: i.qty,
        unitPrice: i.price,
        totalAmount: i.qty * i.price,
        discount: 0
      })),
      billingAddress: this.billing,
      shippingAddress: this.shipping
    };

    this.api.placeOrder(payload).subscribe(() => {
      alert('Order placed successfully!');
      this.router.navigate(['/store']);
    });
  }
}
