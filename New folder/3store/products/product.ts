import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';

interface Product {
  id: number;
  name: string;
  category: string;
  price: number;
  image?: string;
}

@Component({
  selector: 'app-store-products',
  standalone: true,
  imports: [CommonModule, FormsModule, RouterModule],
  templateUrl: './products.component.html',
  styleUrls: ['./products.component.css']
})
export class ProductsComponent {

  products: Product[] = [
    { id: 1, name: 'iPhone 15', category: 'Mobiles', price: 80000 },
    { id: 2, name: 'Samsung Galaxy S24', category: 'Mobiles', price: 70000 },
    { id: 3, name: 'Dell XPS 15', category: 'Laptops', price: 120000 },
    { id: 4, name: 'Sony Bravia 55"', category: 'TVs', price: 90000 }
  ];

  filteredProducts = [...this.products];

  selectedCategory = '';
  sortOrder = '';
  maxPrice = 200000;

  applyFilters() {
    this.filteredProducts = this.products.filter(p =>
      (!this.selectedCategory || p.category === this.selectedCategory) &&
      p.price <= this.maxPrice
    );

    if (this.sortOrder === 'low') {
      this.filteredProducts.sort((a, b) => a.price - b.price);
    } else if (this.sortOrder === 'high') {
      this.filteredProducts.sort((a, b) => b.price - a.price);
    }
  }
}
