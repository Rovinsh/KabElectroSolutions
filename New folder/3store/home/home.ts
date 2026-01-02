import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';

@Component({
  selector: 'app-store-home',
  standalone: true,
  imports: [CommonModule, RouterModule],
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent {
  categories = [
    { name: 'Mobiles', icon: '📱' },
    { name: 'Laptops', icon: '💻' },
    { name: 'TVs', icon: '📺' },
    { name: 'Appliances', icon: '🧊' },
    { name: 'Accessories', icon: '🎧' }
  ];
}
