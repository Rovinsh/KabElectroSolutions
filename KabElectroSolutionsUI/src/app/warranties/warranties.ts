import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ColDef } from 'ag-grid-community';
import { MatDialog, MatDialogModule } from '@angular/material/dialog';
import { AgGridModule } from 'ag-grid-angular';
import { ApiService, WarrantyDto } from '../services/api.service';
import { WarrantyFormComponent } from '../warranty-form/warranty-form';

@Component({
  selector: 'app-warranties',
  standalone: true,
  imports: [CommonModule, MatDialogModule, AgGridModule],
 templateUrl: './warranties.html',
  styleUrl: './warranties.css'
})
export class Warranties implements OnInit {
  constructor(private dialog: MatDialog, private apiService: ApiService) {}
  warranties: WarrantyDto[] = [];
  ngOnInit(): void {
    this.loadWarranties();
  }

  loadWarranties() {
    this.apiService.getWarranty().subscribe(res => {
      this.warranties = res.data.sort((a: any, b: any) => a.warrantyDisplayName.localeCompare(b.warrantyDisplayName));
    });
  }

  openPopup(data?: any) {
  const isEdit = !!data; 
   const dialogRef = this.dialog.open(WarrantyFormComponent, {
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
      this.loadWarranties();
    }
  });
}


  onCellClicked(event: any) {
    if (event.colDef.headerName === 'Action' && event.event.target.classList.contains('edit-link')) {
      this.openPopup(event.data); 
    }
  }

  warrantyCols: ColDef[] = [
    { headerName: 'Sno', width: 60, valueGetter: (params: any) => params.node.rowIndex + 1 },
    { headerName: 'Warranty', field: 'warrantyDisplayName', filter: true, width: 100 },
    { headerName: 'Serial NO', field: 'serialNumber', filter: true, width: 100 },
    { headerName: 'Type', field: 'warrantyType', filter: true, width: 100 },
    { headerName: 'Code', field: 'warrantyCode', filter: true, width: 100 },
    { headerName: 'Price', field: 'warrantyPrice', filter: true, width: 100 },
    { headerName: 'Duration', field: 'warrantyDuration', filter: true, width: 100 },
    { headerName: 'Start Date', field: 'warrantyStartDate', filter: true, width: 100 },
    { headerName: 'End Date', field: 'warrantyEndDate', filter: true, width: 100 },
    { headerName: 'Invoice No', field: 'warrantyInvoiceNo', filter: true, width: 100 },
    { headerName: 'Purchase Date', field: 'warrantyPurchaseDate', filter: true, width: 100 },
    { headerName: 'Product Name', field: 'productName', filter: true, width: 100 },
    { headerName: 'Seller', field: 'warrantySeller', filter: true, width: 100 },
    { headerName: 'Coupon Code', field: 'warrantyCouponCode', filter: true, width: 100 },
    { headerName: 'Customer Name', field: 'customerName', filter: true, width: 100 },
    { headerName: 'Customer Mobile No', field: 'customerMobileNo', filter: true, width: 100 },
    { headerName: 'Customer Email', field: 'customerEmail', filter: true, width: 100 },
    { headerName: 'Address', field: 'customerAddress', filter: true, width: 100 },
    { headerName: 'City', field: 'customerCityName', filter: true, width: 100 },
    { headerName: 'State', field: 'customerStateName', filter: true, width: 100 },
    { headerName: 'Pincode', field: 'customerPinCode', filter: true, width: 100 },
    { headerName: 'Scratch Code', field: 'warrantyScratchCode', filter: true, width: 100 },
    { headerName: 'Extra Info', field: 'warrantyExtraInfo', filter: true, width: 100 },
    {
      headerName: 'Extra Info',
      field: 'warrantyExtraInfo',
      filter: false,
      width: 200,
      cellRenderer: (params: any) => {
        const words = params.value ? params.value.split(' ') : [];
        if (words.length > 150) return words.slice(0, 150).join(' ') + '...';
        return params.value;
      }
    },
     {
      headerName: 'Description',
      field: 'warrantyDescription',
      filter: false,
      width: 200,
      cellRenderer: (params: any) => {
        const words = params.value ? params.value.split(' ') : [];
        if (words.length > 150) return words.slice(0, 150).join(' ') + '...';
        return params.value;
      }
    },
    { headerName: 'Created By', field: 'warrantyCreatedBy', filter: true, width: 100 },
    
    {
      headerName: 'Active',
      field: 'isDisable',
      filter: true,
      cellRenderer: (params: any) =>
        params.value == 1
          ? '<span class="badge bg-success">Active</span>'
          : '<span class="badge bg-danger">Inactive</span>'
    },
    {
      headerName: 'Action',
      width: 120,
      cellRenderer: (params: any) => {
        return `<a href="javascript:void(0)" class="edit-link" data-id="${params.data.id}">✏️</a>`;
      }
    }
  ];

}
