import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ColDef } from 'ag-grid-community';
import { MatDialog, MatDialogModule } from '@angular/material/dialog';
import { AgGridModule } from 'ag-grid-angular';
import { ApiService, UserDto } from '../services/api.service';

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
  users: UserDto[] = [];
  ngOnInit(): void {
    this.loadUsers();
  }

  loadUsers() {this.isLoading = true;
    this.apiService.getUsers().subscribe(res => {
      this.users = res.data.sort((a: any, b: any) => a.firstName.localeCompare(b.firstName));
      this.isLoading = false;
    });
  }

  userCols: ColDef[] = [
    { headerName: 'Sno', width: 60, valueGetter: (params: any) => params.node.rowIndex + 1 },
    { headerName: 'First Name', field: 'firstName', filter: true, width: 100 },
    { headerName: 'Last Name', field: 'lastName', filter: true, width: 100 },
    { headerName: 'Phone', field: 'phone', filter: true, width: 100 },
    { headerName: 'Email', field: 'email', filter: true, width: 100 },
    { headerName: 'City', field: 'cityName', filter: true, width: 100 },
    { headerName: 'State', field: 'stateName', filter: true, width: 100 },
    { headerName: 'Pincode', field: 'pinCode', filter: true, width: 100 },
    { headerName: 'Address', field: 'address', filter: true, width: 100 }
  ];

}
