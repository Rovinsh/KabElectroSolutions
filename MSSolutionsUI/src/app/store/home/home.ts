import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { ProductCardComponent } from '../product-card/product-card.component';

@Component({
  selector: 'app-store-home',
  standalone: true,
  imports: [CommonModule, RouterModule,ProductCardComponent],
  templateUrl: './home.html',
  styleUrls: ['./home.css']
})
export class HomeComponent {
  categories = [
    { name: 'Mobiles', icon: '📱' },
    { name: 'Laptops', icon: '💻' },
    { name: 'TVs', icon: '📺' },
    { name: 'Appliances', icon: '🧊' },
    { name: 'Accessories', icon: '🎧' }
  ];

  heroSlides = [
    { title: 'Ink Tank & Laser Printers', subtitle: 'Starting at ₹10,699', image: '/assets/banners/heroBanner.webp' },
    { title: 'Big Screen TVs', subtitle: 'Up to 40% Off', image: '/assets/banners/2.jpg' },
    { title: 'Latest Smartphones', subtitle: 'Starting at ₹12,999', image: '/assets/banners/3.jpg' }
  ];

  activeSlide = 0;
  private intervalId: any;

  ngOnInit() {
    this.startAutoSlide();
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
   products = [
    {
      name: 'ZipCare Maintain Laptop Support - 1 Year',
      price: 2499,
      oldPrice: 2999,
      discount: 17,
      rating: 4.8,
      reviewCount: 2,
      deliveryDate: 'Thu, 8th Jan',
      image: 'assets/product/258056_yn4siy.webp'
    },
    {
      name: 'ZipCare Maintain Plan for Washing Machine - 1 Time',
      price: 499,
      oldPrice: 699,
      discount: 29,
      rating: 4.6,
      reviewCount: 12,
      deliveryDate: 'Thu, 8th Jan',
      image: 'assets/product/258056_yn4siy.webp'
    },
    {
      name: 'ZipCare Maintain Plan for Washing Machine - 1 Time',
      price: 499,
      oldPrice: 699,
      discount: 29,
      rating: 4.6,
      reviewCount: 12,
      deliveryDate: 'Thu, 8th Jan',
      image: 'assets/product/258056_yn4siy.webp'
    },
    {
      name: 'ZipCare Maintain Plan for Washing Machine - 1 Time',
      price: 499,
      oldPrice: 699,
      discount: 29,
      rating: 4.6,
      reviewCount: 12,
      deliveryDate: 'Thu, 8th Jan',
      image: 'assets/product/258056_yn4siy.webp'
    },
    {
      name: 'ZipCare Maintain Plan for Washing Machine - 1 Time',
      price: 499,
      oldPrice: 699,
      discount: 29,
      rating: 4.6,
      reviewCount: 12,
      deliveryDate: 'Thu, 8th Jan',
      image: 'assets/product/258056_yn4siy.webp'
    },
    {
      name: 'ZipCare Maintain Plan for Washing Machine - 1 Time',
      price: 499,
      oldPrice: 699,
      discount: 29,
      rating: 4.6,
      reviewCount: 12,
      deliveryDate: 'Thu, 8th Jan',
      image: 'assets/product/258056_yn4siy.webp'
    }
  ];
}



