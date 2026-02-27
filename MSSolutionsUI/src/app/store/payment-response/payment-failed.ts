import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { MatDialogModule } from '@angular/material/dialog';

@Component({
  selector: 'app-payment-failed',
  standalone: true,
  imports: [CommonModule, RouterModule, MatDialogModule],
  templateUrl: './payment-failed.html',
  styleUrls: ['./payment-failed.css']   // reuse same css
})
export class PaymentuFailedComponent {}