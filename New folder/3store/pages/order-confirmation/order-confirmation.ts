import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ActivatedRoute, RouterModule } from '@angular/router';

@Component({
  selector: 'app-order-confirmation',
  standalone: true,
  imports: [CommonModule, RouterModule],
  templateUrl: './order-confirmation.component.html',
  styleUrls: ['./order-confirmation.component.css']
})
export class OrderConfirmationComponent implements OnInit {
  orderCode!: string;

  constructor(private route: ActivatedRoute) {}

  ngOnInit() {
    this.orderCode = this.route.snapshot.queryParamMap.get('orderCode') || '';
  }
  
}
