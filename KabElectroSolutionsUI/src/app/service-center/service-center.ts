import { Component } from '@angular/core';
import { ApiService,ServiceCenter } from '../services/api.service';
import { ColDef, GridApi,GridReadyEvent  } from 'ag-grid-community';
import { CommonModule } from '@angular/common';
import { MatDialogModule } from '@angular/material/dialog';
import { AgGridModule } from 'ag-grid-angular';

@Component({
  selector: 'app-service-center',
  imports: [CommonModule, MatDialogModule, AgGridModule],
  templateUrl: './service-center.html',
  styleUrl: './service-center.css'
})
export class ServiceCenterComponent  {
rowData: ServiceCenter[] = [];
  gridApi!: GridApi;

  cityFilter: string = '';
  pincodeFilter: string = '';

  // ✅ Column Definitions with floating filters
  columnDefs: ColDef[] = [
    { field: 'svcName', flex: 2, headerName: 'SVC Name', filter: true, floatingFilter: true },
    { field: 'city', flex: 2, filter: true, floatingFilter: true },
    { field: 'state', flex: 2, filter: true, floatingFilter: true},
    { field: 'pincode', flex: 2, filter: true, floatingFilter: true },
    { field: 'mobileNumber', flex: 2, filter: true, floatingFilter: true},
    { field: 'email', flex: 2, filter: true, floatingFilter: true},
    { field: 'address' , flex: 3, filter: true, floatingFilter: true, cellStyle: {
      whiteSpace: 'nowrap',
      overflow: 'hidden',
      textOverflow: 'ellipsis'
    },
    tooltipField: 'address'},
    { field: 'phoneNumber', flex: 2, filter: true, floatingFilter: true},
  ];

  defaultColDef = {
  sortable: true,
  resizable: true
};

  constructor(private service: ApiService) {}

  ngOnInit() {
    this.service.getAllServiceCenters().subscribe(data => {
      this.rowData = data;
    });
  }

  // ✅ Grid Ready
  onGridReady(params: GridReadyEvent) {
    this.gridApi = params.api;
  }

  // ✅ City Filter
  onCityFilter(value: string) {
    this.cityFilter = value;

    this.gridApi.setFilterModel({
      ...this.gridApi.getFilterModel(),
      city: value
        ? { type: 'contains', filter: value }
        : null
    });

    this.gridApi.onFilterChanged();
  }

  // ✅ Pincode Filter
  onPincodeFilter(value: string) {
    this.pincodeFilter = value;

    this.gridApi.setFilterModel({
      ...this.gridApi.getFilterModel(),
      pincode: value
        ? { type: 'contains', filter: value }
        : null
    });

    this.gridApi.onFilterChanged();
  }

  // ✅ Clear Filters
  clearFilters() {
    this.cityFilter = '';
    this.pincodeFilter = '';
    this.gridApi.setFilterModel(null);
  }
}
