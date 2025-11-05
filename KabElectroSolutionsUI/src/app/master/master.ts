import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ColDef } from 'ag-grid-community';
import { MatDialog, MatDialogModule } from '@angular/material/dialog';
import { AgGridModule } from 'ag-grid-angular';
import { CategoryFormComponent } from '../../app/category-form/category-form';
import { BrandFormComponent } from '../../app/brand-form/brand-form';
import { PlanFormComponent } from '../../app/plan-form/plan-form';
import { ServicePartnerFormComponent } from '../../app/service-partner-form/service-partner-form';
import { ApiService, CategoryDto, PlanDto, BrandDto, ServicePartnerDto } from '../services/api.service';

@Component({
  selector: 'app-master',
  standalone: true,
  imports: [CommonModule, MatDialogModule, AgGridModule],
  templateUrl: './master.html',
  styleUrls: ['./master.css']
})
export class MasterComponent implements OnInit {
  activeTab: string = 'category';
  categories: CategoryDto[] = [];
  brands: BrandDto[] = [];
  plans: PlanDto[] = [];
  servicePartner: ServicePartnerDto[] = [];

  constructor(private dialog: MatDialog, private apiService: ApiService) {}

  ngOnInit(): void {
    this.reloadData();
  }

  setActiveTab(tab: string) {
    this.activeTab = tab;
    this.reloadData();
  }

  reloadData() {
    switch (this.activeTab) {
      case 'category':
        this.loadCategories();
        break;
      case 'brand':
        this.loadBrands();
        break;
      case 'plan':
        this.loadPlans();
        break;
      case 'servicePartner':
        this.loadServicePartners();
        break;
    }
  }

  loadCategories() {
    this.apiService.getCategories().subscribe(res => {
      this.categories = res.data.sort((a: any, b: any) => a.catName.localeCompare(b.catName));
    });
  }

  loadBrands() {
    this.apiService.getBrands().subscribe(res => {
      this.brands = res.data.sort((a: any, b: any) => a.brandName.localeCompare(b.brandName));
    });
  }

  loadPlans() {
    this.apiService.getPlans().subscribe(res => {
    this.plans = res.data.sort((a: any, b: any) => a.planName.localeCompare(b.planName));
    });
  }

  loadServicePartners() {
    this.apiService.getServicePartners().subscribe(res => {
    this.servicePartner = res.data.sort((a: any, b: any) => a.servicePartner.localeCompare(b.servicePartner));
    });
  }

  openPopup(data?: any) {
  const isEdit = !!data; 
  let dialogRef;

  switch (this.activeTab) {
    case 'category':
      dialogRef = this.dialog.open(CategoryFormComponent, {
        width: '800px',
        maxWidth: '95vw',  
        maxHeight: '90vh',  
        height: 'auto',
        disableClose: true,
        data: {
          mode: isEdit ? 'edit' : 'add',
          record: data || null
        }
      });
      break;
    case 'brand':
      dialogRef = this.dialog.open(BrandFormComponent, {
        width: '800px',
        maxWidth: '95vw',  
      maxHeight: '90vh', 
      height: 'auto',
        disableClose: true,
        data: {
          mode: isEdit ? 'edit' : 'add',
          record: data || null
        }
      });
      break;
    case 'plan':
      dialogRef = this.dialog.open(PlanFormComponent, {
        width: '800px',
        maxWidth: '95vw',   
        maxHeight: '90vh',  
        height: 'auto',
        disableClose: true,
        data: {
          mode: isEdit ? 'edit' : 'add',
          record: data || null
        }
      });
      break;
      case 'servicePartner':
      dialogRef = this.dialog.open(ServicePartnerFormComponent, {
        width: '800px',
        maxWidth: '95vw',   
        maxHeight: '90vh',  
        height: 'auto',
        disableClose: true,
        data: {
          mode: isEdit ? 'edit' : 'add',
          record: data || null
        }
      });
      break;
  }

  dialogRef?.afterClosed().subscribe(result => {
    if (result === 'success') {
      this.reloadData();
    }
  });
}


  onCellClicked(event: any) {
    if (event.colDef.headerName === 'Action' && event.event.target.classList.contains('edit-link')) {
      this.openPopup(event.data); 
    }
  }

  categoryCols: ColDef[] = [
    { headerName: 'Sno', width: 60, valueGetter: (params: any) => params.node.rowIndex + 1 },
    { headerName: 'Name', field: 'catName', filter: true, width: 250 },
    {
      headerName: 'Description',
      field: 'description',
      filter: false,
      width:300,
      cellRenderer: (params: any) => {
        const words = params.value ? params.value.split(' ') : [];
        if (words.length > 150) return words.slice(0, 150).join(' ') + '...';
        return params.value;
      }
    },
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

  brandCols: ColDef[] = [
    { headerName: 'Sno', width: 60, valueGetter: (params: any) => params.node.rowIndex + 1 },
    { headerName: 'Category Name', field: 'categoryName', filter: true, width: 210 },
    { headerName: 'Brand Name', field: 'brandName', filter: true, width: 230 },
    {
      headerName: 'Description',
      field: 'description',
      filter: false,
      width: 350,
      cellRenderer: (params: any) => {
        const words = params.value ? params.value.split(' ') : [];
        if (words.length > 150) return words.slice(0, 150).join(' ') + '...';
        return params.value;
      }
    },
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

  planCols: ColDef[] = [
    { headerName: 'Sno', width: 60, valueGetter: (params: any) => params.node.rowIndex + 1 },
    { headerName: 'Category Name', field: 'categoryName', filter: true, width: 150 },
    { headerName: 'Plan Name', field: 'planName', filter: true, width: 200 },
    {
      headerName: 'Description',
      field: 'description',
      filter: false,
      width: 250,
      cellRenderer: (params: any) => {
        const words = params.value ? params.value.split(' ') : [];
        if (words.length > 150) return words.slice(0, 150).join(' ') + '...';
        return params.value;
      }
    },
    {
      headerName: 'Remark',
      field: 'remark',
      filter: false,
      width: 250,
      cellRenderer: (params: any) => {
        const words = params.value ? params.value.split(' ') : [];
        if (words.length > 150) return words.slice(0, 150).join(' ') + '...';
        return params.value;
      }
    },
    {
      headerName: 'Active',
      field: 'isDisable',
      filter: true,
      width: 100,
      cellRenderer: (params: any) =>
        params.value == 1
          ? '<span class="badge bg-success">Active</span>'
          : '<span class="badge bg-danger">Inactive</span>'
    },
    {
      headerName: 'Action',
      width: 100,
      cellRenderer: (params: any) => {
        return `<a href="javascript:void(0)" class="edit-link" data-id="${params.data.id}">✏️</a>`;
      }
    }
  ];

  servicePartnerCols: ColDef[] = [
  { headerName: 'Sno', width: 60, valueGetter: (params: any) => params.node.rowIndex + 1 },
  { headerName: 'Service Partner', field: 'servicePartner', filter: true, width: 180 },
  { headerName: 'Phone', field: 'phone', filter: true, width: 130 },
  { headerName: 'Email', field: 'email', filter: true, width: 130 },
  { headerName: 'PAN', field: 'pan', filter: true, width: 130 },
  { headerName: 'GST', field: 'gst', filter: true, width: 150 },
  { headerName: 'City', field: 'cityName', filter: true, width: 150 },
  { headerName: 'State', field: 'stateName', filter: true, width: 150 },
  { headerName: 'Pincode', field: 'pinCode', filter: true, width: 100 },
  { headerName: 'Address', field: 'address', filter: false, width: 250,
    cellRenderer: (params: any) => {
      const words = params.value ? params.value.split(' ') : [];
      if (words.length > 150) return words.slice(0, 150).join(' ') + '...';
      return params.value;
    }
  },
 
  {
    headerName: 'Active',
    field: 'isDisable',
    filter: true,
    width: 100,
    cellRenderer: (params: any) =>
      params.value == 1
        ? '<span class="badge bg-success">Active</span>'
        : '<span class="badge bg-danger">Inactive</span>'
  },
  {
    headerName: 'Action',
    width: 100,
    cellRenderer: (params: any) => {
      return `<a href="javascript:void(0)" class="edit-link" data-id="${params.data.id}">✏️</a>`;
    }
  }
];

}
