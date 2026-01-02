import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ActivatedRoute } from '@angular/router';
import { CartService } from '../services/cart.service';

@Component({
  selector: 'app-product-detail',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './product-detail.component.html',
  styleUrls: ['./product-detail.component.css']
})
export class ProductDetailComponent implements OnInit {

  product: any;
  qty = 1;

  private products = [
    { id: 1, name: 'iPhone 15', price: 80000, description: 'Latest Apple iPhone' },
    { id: 2, name: 'Samsung Galaxy S24', price: 70000, description: 'Latest Samsung flagship' },
    { id: 3, name: 'Dell XPS 15', price: 120000, description: 'High performance laptop' },
    { id: 4, name: 'Sony Bravia 55"', price: 90000, description: 'Ultra HD Smart TV' }
  ];

constructor(private route: ActivatedRoute, private cart: CartService) {}

addToCart() {
  this.cart.add({ id: this.product.id, name: this.product.name, price: this.product.price, qty: this.qty });
  alert('Added to cart');
}
  ngOnInit() {
    const id = Number(this.route.snapshot.paramMap.get('id'));
    this.product = this.products.find(p => p.id === id);
  }

  increase() { this.qty++; }
  decrease() { if (this.qty > 1) this.qty--; }

}
