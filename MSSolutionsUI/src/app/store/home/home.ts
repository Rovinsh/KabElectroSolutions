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
  selectedCategoryId = '';
  ngOnInit() {
  this.apiService.getHomeProduct().subscribe({
    next: (res) => {

       this.categories =  res.data?.categories.filter(x => x.isDisable) ?? res.data?.categories ?? [];
      this.productList = res.data?.homeProducts.filter(x => x.isActive) ?? res.data?.homeProducts ?? [];
     
      const airCategory = this.categories.find(c =>
        c.catName.toLowerCase().includes('air')
      );

      if (airCategory) {
        this.productList = this.productList.filter(
          x => x.isActive &&
           x.categoryId === airCategory.id
        );
        this.selectedCategoryId = airCategory.catUrl;
      }
    },
    error: (err) => {
      console.error('Home init failed', err);
    }
  });
}

    services = [
    { title: 'Cost Saving', icon: '💰' },
    { title: 'Expert Assistance', icon: '🙋‍♂️' },
    { title: '24x7 Support', icon: '📞' },
    { title: 'Secure Payments', icon: '🔒' },
    { title: 'Doorstep Service', icon: '🛠️' },
    { title: 'Genuine Spare Parts', icon: '⚙️' }
  ];
activeIndex: number | null = null;

faqs = [
  {
    question: 'How quickly can I get a service?',
    answer:
      'We aim for same-day or next-day service in most areas.'
  },
  {
    question: 'Which brands are covered?',
    answer:
      'We cover all major appliance and device brands—details available on request'
  },
  {
    question: 'Is there a warranty on services?',
    answer:
      'Yes, we provide a service warranty—specifics depend on the service provided.'
  }
];

toggleFaq(index: number) {
  this.activeIndex = this.activeIndex === index ? null : index;
}

}