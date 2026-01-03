import { Component, Input } from '@angular/core';
import { CommonModule } from '@angular/common';
import { CartService } from '../services/cart.service';
@Component({
  selector: 'app-product-card',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './product-card.component.html',
  styleUrls: ['./product-card.component.css']
})
export class ProductCardComponent {
  @Input() product!: any;
    constructor(private cartService: CartService) {}
      addToCart() {
    this.cartService.addToCart(this.product);
    alert(`${this.product.name} added to cart!`);
  }
}
