import { Component, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { ProductCardComponent } from '../product-card/product-card.component';
import { ApiService, CategoryDto, ProductWithImagesDto } from '../../services/api.service';
import { forkJoin } from 'rxjs';
@Component({
  selector: 'app-store-home',
  standalone: true,
  imports: [CommonModule, RouterModule,ProductCardComponent],
  templateUrl: './home.html',
  styleUrls: ['./home.css']
})
export class HomeComponent {
  private apiService = inject(ApiService);
  categories: CategoryDto[] = [];
  productList: ProductWithImagesDto[] = [];

  heroSlides = [
    { title: 'Ink Tank & Laser Printers', subtitle: 'Starting at ₹10,699', image: '/assets/banners/vblue-home-services.jpg' },
    { title: 'Big Screen TVs', subtitle: 'Up to 40% Off', image: '/assets/banners/2.jpg' },
    { title: 'Latest Smartphones', subtitle: 'Starting at ₹12,999', image: '/assets/banners/3.jpg' }
  ];

  activeSlide = 0;
  private intervalId: any;
 
  ngOnInit() {
    this.startAutoSlide();
     forkJoin({
              category: this.apiService.getCategories(),
              product: this.apiService.getProduct(),
            }).subscribe({
              next: (result) => {
                this.categories = result.category.data.filter(x => x.isDisable) ?? result.category;
                this.productList = result.product.data.filter(x => x.isActive) ?? result.product; 
                }
            });  
  }

  ngOnDestroy() {
    this.stopAutoSlide();
  }

  startAutoSlide() {
    this.intervalId = setInterval(() => {
      this.next();
    }, 4000); // 4 seconds
  }

  stopAutoSlide() {
    if (this.intervalId) {
      clearInterval(this.intervalId);
    }
  }

  next() {
    this.activeSlide = (this.activeSlide + 1) % this.heroSlides.length;
  }

  prev() {
    this.activeSlide =
      (this.activeSlide - 1 + this.heroSlides.length) % this.heroSlides.length;
  }
    services = [
    { title: 'Free Delivery', icon: '🚚' },
    { title: 'Easy Returns', icon: '↩️' },
    { title: '24x7 Support', icon: '📞' },
    { title: 'Secure Payments', icon: '🔒' },
    { title: 'Doorstep Service', icon: '🛠️' },
    { title: 'Genuine Spare Parts', icon: '⚙️' }
  ];

}