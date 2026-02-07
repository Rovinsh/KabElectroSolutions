import { Component, Inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatDialogModule, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { OrderDTO } from '../../services/api.service';

@Component({
  selector: 'app-user-order-detail',
  standalone: true,
  imports: [CommonModule, MatDialogModule],
  templateUrl: './user-order-detail.html',
  styleUrls: ['./user-order-detail.css'],
})
export class UserOrderDetailComponent {

  order: OrderDTO | null = null;

  constructor(
    public dialogRef: MatDialogRef<UserOrderDetailComponent>,
    @Inject(MAT_DIALOG_DATA) public data: { record: OrderDTO }
  ) {
    this.order = data.record;
  }

  onClose() {
    this.dialogRef.close();
  }
}
