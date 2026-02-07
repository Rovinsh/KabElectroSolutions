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
     forkJoin({
              category: this.apiService.getCategories(),
              product: this.apiService.getProduct(),
            }).subscribe({
              next: (result) => {
                this.categories = result.category.data.filter(x => x.isDisable) ?? result.category;
                const airCategory = this.categories.find(c =>c.catName.toLowerCase().includes('air'));
                this.productList = result.product.data.filter(x => x.isActive) ?? result.product; 
                if (airCategory) {
                   this.productList = result.product.data.filter(x => x.isActive &&  x.categoryId === airCategory?.id) ?? result.product; 
                    this.selectedCategoryId = airCategory.catUrl;
                 } 
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