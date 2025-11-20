import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ColDef } from 'ag-grid-community';
import { MatDialog, MatDialogModule } from '@angular/material/dialog';
import { AgGridModule } from 'ag-grid-angular';
import { ApiService, UserDto } from '../services/api.service';
import { UserFormComponent } from '../user-form/user-form';

@Component({
  selector: 'aapp-user',
  standalone: true,
  imports: [CommonModule, MatDialogModule, AgGridModule],
  templateUrl: './user.html',
  styleUrl: './user.css'
})
export class UserComponent implements OnInit {
  constructor(private dialog: MatDialog, private apiService: ApiService) {}
  users: UserDto[] = [];
  ngOnInit(): void {
    this.loadUsers();
  }

  loadUsers() {
    this.apiService.getUsers().subscribe(res => {
      this.users = res.data.sort((a: any, b: any) => a.firstName.localeCompare(b.firstName));
    });
  }

  openPopup(data?: any) {
  const isEdit = !!data; 
   const dialogRef = this.dialog.open(UserFormComponent, {
      width: '900px',
      maxWidth: '95vw',   
      maxHeight: '90vh', 
      height: 'auto',
      panelClass: 'custom-dialog-container',
      disableClose: true,
      data: {
        mode: isEdit ? 'edit' : 'add',
        record: data || null
      }
    });
  
  dialogRef?.afterClosed().subscribe(result => {
    if (result === 'success') {
      this.loadUsers();
    }
  });
}


  onCellClicked(event: any) {
    if (event.colDef.headerName === 'Action' && event.event.target.classList.contains('edit-link')) {
      this.openPopup(event.data); 
    }
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
    { headerName: 'Address', field: 'address', filter: true, width: 100 },
    {
      headerName: 'Action',
      width: 120,
      cellRenderer: (params: any) => {
        return `<a href="javascript:void(0)" class="edit-link" data-id="${params.data.id}">✏️</a>`;
      }
    }
  ];

}
