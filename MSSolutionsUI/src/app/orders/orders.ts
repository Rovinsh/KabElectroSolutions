import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ColDef } from 'ag-grid-community';
import{ OrderDetailComponent} from '../../app/order-detail/order-detail';
import { MatDialog, MatDialogModule } from '@angular/material/dialog';
import { AgGridModule } from 'ag-grid-angular';
import { ApiService, OrderDTO } from '../services/api.service';

@Component({
  selector: 'aapp-order',
  standalone: true,
  imports: [CommonModule, MatDialogModule, AgGridModule],
  templateUrl: './orders.html',
  styleUrl: './orders.css'
})
export class OrderComponent implements OnInit {
  isLoading = false;
  constructor(private dialog: MatDialog, private apiService: ApiService) {}
  orders: OrderDTO[] = [];
  ngOnInit(): void {
    this.loadOrders();
  }

  loadOrders() {this.isLoading = true;
    this.apiService.getOrders().subscribe(res => {
      this.orders = res.data.sort((a: any, b: any) => a.orderCode.localeCompare(b.orderCode));
      this.isLoading = false;
    });
  }

openPopup(data: OrderDTO) {
  this.dialog.open(OrderDetailComponent, {
    width: '800px',
    maxWidth: '95vw',
    maxHeight: '90vh',
    disableClose: true,
    data: { record: data }
  });
}


onCellClicked(event: any) {
    if (event.colDef.headerName === 'Detail' && event.event.target.classList.contains('detail-link')) {
      this.openPopup(event.data); 
    }
  }

 OrderCols: ColDef[] = [
  { headerName: 'S.No', width: 70, valueGetter: (params: any) => params.node.rowIndex + 1 }
  ,  {
    headerName: 'Detail',
    width: 80,
    cellRenderer: (params: any) =>
      `<a href="javascript:void(0)" class="detail-link" data-id="${params.data.id}">🚚📦</a>`
  }, { headerName: 'Order Code', field: 'orderCode', filter: true, width: 180 },
 {
  headerName: 'Payment Status',
  field: 'paymentStatus',
  filter: true,
  width: 120,
  cellStyle: (params: any) => {
    if (!params.value) return null;

    const status = params.value.toLowerCase();

    if (status === 'pending') {
      return { color: 'red', fontWeight: 'bold' };
    }
    if (status === 'complete' || status === 'paid') {
      return { color: 'green', fontWeight: 'bold' };
    }
    return null;
  }
},{ headerName: 'Grand Total', field: 'grandTotal', filter: true, width: 120 },
  { headerName: 'Receive Amount', field: 'receiveAmount', filter: true, width: 120 },
  { headerName: 'Sub Total', field: 'subTotal', filter: true, width: 120 },
  { headerName: 'Tax Amount', field: 'taxAmount', filter: true, width: 120 },
  { headerName: 'Shipping Amount', field: 'shippingAmount', filter: true, width: 120 },
  { headerName: 'Discount Amount', field: 'discountAmount', filter: true, width: 120 },
  { headerName: 'Coupon Amount', field: 'couponAmount', filter: true, width: 120 },
  { headerName: 'User Name', field: 'UserName', filter: true, width: 120 },
  { headerName: 'Order Status', field: 'orderStatus', filter: true, width: 100 },
  { headerName: 'Coupon Code', field: 'couponCode', filter: true, width: 120 },
  { headerName: 'Razorpay Order Id', field: 'razorpayOrderId', filter: true, width: 130 },
  { headerName: 'Razorpay Payment Id', field: 'razorpayPaymentId', filter: true, width: 130 },
  { headerName: 'Razorpay Signature', field: 'razorpaySignature', filter: true, width: 150 },
  {
    headerName: 'Order Date',
    field: 'orderDate',
    filter: true,
    width: 130,
    valueFormatter: params => params.value ? new Date(params.value).toLocaleDateString() : ''
  },
  {
    headerName: 'Payment Date',
    field: 'paymentDate',
    filter: true,
    width: 130,
    valueFormatter: params => params.value ? new Date(params.value).toLocaleDateString() : ''
  }
];

}
