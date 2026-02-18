import { Component,inject } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { ApiService, OrderDTO, ProductDto, TopSellingProductDto, UserDto } from '../services/api.service';
import { MatDialog } from '@angular/material/dialog';
import { RouterModule } from '@angular/router';
import { MatIconModule } from '@angular/material/icon'
import { AuthService } from '../services/auth';
import { ColDef } from 'ag-grid-community';
import { AgGridModule } from 'ag-grid-angular';
import { forkJoin } from 'rxjs';
import { OrderDetailComponent } from '../order-detail/order-detail';

@Component({
  selector: 'app-dashboard',
  imports:[FormsModule,CommonModule, RouterModule,MatIconModule,AgGridModule],
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent {
 orders: OrderDTO[] = [];
 topTenOrders:OrderDTO[] = [];
 topSellingProducts:TopSellingProductDto[]=[];
 product: ProductDto[] = [];
 customers : UserDto[] = [];
 users: UserDto[] = [];
 topProducts: any[] = [];
 cards: any[] = [];
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
  constructor(
    private apiService: ApiService,
    private dialog: MatDialog,
    private auth: AuthService
  ) {}
   ngOnInit(): void {
     this.loadDashboardData();
  }

  loadDashboardData() {
  forkJoin({
    orders: this.apiService.getOrders(),
    products: this.apiService.getProduct(),
    customers: this.apiService.getCustomrs(),
    users: this.apiService.getUsers(),
    topSellingProduct: this.apiService.getTopSellingProducts()
  }).subscribe({
    next: (res) => {

      // Orders
      this.orders = res.orders.data.sort((a: any, b: any) =>
        a.orderCode.localeCompare(b.orderCode)
      );

    this.topTenOrders = res.orders.data
      .sort((a: any, b: any) =>
        new Date(b.orderDate).getTime() - new Date(a.orderDate).getTime()
      )
      .slice(0, 10);
      // Products
      this.product = res.products.data.sort((a: any, b: any) =>
        a.productName.localeCompare(b.productName)
      );

       this.topSellingProducts = res.topSellingProduct.data.sort((a: any, b: any) =>
        a.productName.localeCompare(b.productName)
      );

    this.topProducts = this.topSellingProducts.map((p: any) => ({
      categoryName: p.categoryName,
      brand:p.brandName,     // or remove if not needed
      productName: p.productName,
      price: p.totalAmount,          // total revenue
      orders: p.orderCount
    }));
      // Customers
      this.customers = res.customers.data.sort((a: any, b: any) =>
        a.firstName.localeCompare(b.firstName)
      );

      // Users / Employees
      this.users = res.users.data.sort((a: any, b: any) =>
        a.firstName.localeCompare(b.firstName)
      );

      // Update dashboard cards
      this.updateCards();
    },
    error: () => {
    }
  });
}
onCellClicked(event: any) {
    if (event.colDef.headerName === 'Detail' && event.event.target.classList.contains('detail-link')) {
      this.openPopup(event.data); 
    }
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
getTotalGST(): number {
  return this.orders.reduce((sum: number, o: any) => {
    return sum + (o.taxAmount || 0);
  }, 0);
}
getTotalCouponAmount(): number {
  return this.orders.reduce((sum: number, o: any) => {
    return sum + (o.couponAmount|| 0);
  }, 0);
}

updateCards() {
  const totalGST = this.getTotalGST();
  const totalCouponAmount = this.getTotalCouponAmount();

  this.cards = [
    {
      label: 'Total Orders',
      value: this.orders.length,
      icon: 'bi-cart',
      bg: 'linear-gradient(45deg,#8BC34A,#CDDC39)',
      link: '/crm/orders'
    },
    {
      label: 'Total Products',
      value: this.product.length,
      icon: 'bi-box',
      bg: 'linear-gradient(45deg,#FF5722,#FF9800)',
      link: '/crm/master'
    },
    {
      label: 'Total User',
      value: this.customers.length,
      icon: 'bi-people',
      bg: 'linear-gradient(45deg,#FFC107,#FFEB3B)',
      link: '/crm/users'
    },
    {
      label: 'Total Employees',
      value: this.users.length,
      icon: 'bi-person-badge',
      bg: 'linear-gradient(45deg,#E91E63,#F06292)',
      link: '/crm/employees'   // ✅ ADDED
    },
    {
      label: 'Total TAX',
      value: `₹ ${totalGST.toFixed(2)}`,
      icon: 'bi-pie-chart',
      bg: 'linear-gradient(45deg,#4DD0E1,#80DEEA)',
      link: '/crm/orders'
    },
    {
      label: 'Coupon Amount',
      value: `₹ ${totalCouponAmount.toFixed(2)}`,
      icon: 'bi-ticket-perforated',
      bg: 'linear-gradient(45deg,#A1887F,#8D6E63)',
      link: '/crm/orders'
    }
  ];
}


}
