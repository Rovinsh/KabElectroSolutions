import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule, Router } from '@angular/router';
import { MatDialogModule } from '@angular/material/dialog';

@Component({
  selector: 'app-payment-success',
  standalone: true,
  imports: [CommonModule, RouterModule, MatDialogModule],
  templateUrl: './payment-success.html',
  styleUrls: ['./payment-success.css']
})
export class PaymentuScessComponent {

  orderId: number | null = null;
  amount: number | null = null;

  constructor(private router: Router) {}

  ngOnInit() {
    const navigation = this.router.getCurrentNavigation();

    if (navigation?.extras?.state) {
      this.orderId = navigation.extras.state['orderId'];
      this.amount = navigation.extras.state['amount'];
    }
  }
}