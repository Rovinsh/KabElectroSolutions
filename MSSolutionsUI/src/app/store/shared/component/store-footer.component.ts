import { Component, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule,Router } from '@angular/router';
@Component({
  selector: 'app-store-footer',
  standalone: true,
   imports: [CommonModule,RouterModule], 
  templateUrl: './store-footer.component.html',
  styleUrls: ['./store-footer.component.css']
})
export class StoreFooterComponent {
   private router = inject(Router);
}
