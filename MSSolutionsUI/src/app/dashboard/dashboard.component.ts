import { Component,inject } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { ApiService } from '../services/api.service';
import { MatDialog } from '@angular/material/dialog';
import { RouterModule } from '@angular/router';
import { MatIconModule } from '@angular/material/icon'
import { AuthService } from '../services/auth';
import { ColDef } from 'ag-grid-community';
import { AgGridModule } from 'ag-grid-angular';

@Component({
  selector: 'app-dashboard',
  imports:[FormsModule,CommonModule, RouterModule,MatIconModule,AgGridModule],
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent {
   cards = [
    { label: 'Total Orders', value: '33500', icon: 'bi-currency-dollar', bg: 'linear-gradient(45deg,#8BC34A,#CDDC39)' },
    { label: 'Total Products', value: '5300', icon: 'bi-hand-thumbs-up', bg: 'linear-gradient(45deg,#FF5722,#FF9800)' },
    { label: 'Total Customers', value: '14280', icon: 'bi-people', bg: 'linear-gradient(45deg,#FFC107,#FFEB3B)' },
    { label: 'Total Offers', value: '7520', icon: 'bi-cart', bg: 'linear-gradient(45deg,#E91E63,#F06292)' },
    { label: 'TAX', value: '$2700', icon: 'bi-pie-chart', bg: 'linear-gradient(45deg,#4DD0E1,#80DEEA)' },
    { label: 'DOWNLOADS', value: '12700', icon: 'bi-download', bg: 'linear-gradient(45deg,#A1887F,#8D6E63)' }
  
  ];
  topProducts = [
  { name: 'Gourmet Fresh Pomegranate', date: '25 Aug 2023', price: 4.65, orders: 2, image: 'https://via.placeholder.com/40?text=P' },
  { name: 'Deliciously Sweet Strawberry', date: '25 Aug 2023', price: 6.37, orders: 10, image: 'https://via.placeholder.com/40?text=S' },
  { name: 'Deliciously Sweet Watermelon', date: '25 Aug 2023', price: 5.46, orders: 13, image: 'https://via.placeholder.com/40?text=W' },
  { name: 'Palm Bliss', date: '24 Aug 2023', price: 7.26, orders: 8, image: 'https://via.placeholder.com/40?text=B' }
];
recentOrders = [
    { number: '#1031', date: '30 Sep 2023', name: 'John Doe', status: 'Completed', invoice: '📄' },
    { number: '#1030', date: '30 Sep 2023', name: 'John Doe', status: 'Pending', invoice: '📄' },
    { number: '#1029', date: '30 Sep 2023', name: 'John Doe', status: 'Completed', invoice: '📄' },
    { number: '#1028', date: '30 Sep 2023', name: 'John Doe', status: 'Cancelled', invoice: '📄' }
  ];

  orderCols: ColDef[] = [
    { headerName: 'Number', field: 'number', width: 150 },
    { headerName: 'Date', field: 'date', width: 150 },
    { headerName: 'Name', field: 'name', width: 120 },
    {
      headerName: 'Status',
      field: 'status',
      width: 100,
      cellRenderer: (params: any) => {
        switch (params.value) {
          case 'Completed': return '<span class="badge bg-success">COMPLETED</span>';
          case 'Pending': return '<span class="badge bg-warning text-dark">PENDING</span>';
          case 'Cancelled': return '<span class="badge bg-danger">CANCELLED</span>';
          default: return params.value;
        }
      }
    },
    { headerName: 'Invoice', field: 'invoice', width: 130 }
  ];

  constructor(
    private apiService: ApiService,
    private dialog: MatDialog,
    private auth: AuthService
  ) {}
}
