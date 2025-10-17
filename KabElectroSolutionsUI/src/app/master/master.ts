import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ColDef } from 'ag-grid-community';
import { MatDialog, MatDialogModule } from '@angular/material/dialog';
import { AgGridModule } from 'ag-grid-angular';
import { CategoryFormComponent } from '../../app/category-form/category-form';
import { BrandFormComponent } from '../../app/brand-form/brand-form';
import { PlanFormComponent } from '../../app/plan-form/plan-form';
import { ApiService,CategoryDto, PlanDto, BrandDto } from '../services/api.service';

@Component({
  selector: 'app-master',
  standalone: true,
  imports: [
    CommonModule,
    MatDialogModule,
    AgGridModule
  ],
  templateUrl: './master.html',
  styleUrls: ['./master.css']
})
export class MasterComponent implements OnInit{
  activeTab: string = 'category';
  categories: CategoryDto[] = [];
  brands: BrandDto[] = [];
  plans:PlanDto[] = [];
 constructor(private dialog: MatDialog, private apiService: ApiService) {}

  ngOnInit(): void {
  this.reloadData();
  }

  categoryCols: ColDef[] = [
     { 
    headerName: 'Sno', 
    width: 60,
    valueGetter: (params: any) => params.node.rowIndex + 1 // auto-increment
  },
    { headerName: 'Name', field: 'catName', filter: true ,width: 300},
    {
    headerName: 'Description',
    field: 'description',
    filter: false,
    width: 405,
    cellRenderer: (params: any) => {
      const words = params.value ? params.value.split(' ') : [];
      if (words.length > 250) {
        return words.slice(0, 150).join(' ') + '...';
      }
      return params.value;
    }
  },
    {
      headerName: 'Active',
      field: 'isDisable',
      filter: true,
      cellRenderer: (params: any) =>
        params.value==1
          ? '<span class="badge bg-success">Active</span>'
          : '<span class="badge bg-danger">Inactive</span>'
    },
    {
      headerName: 'Action',
      cellRenderer: (params: any) => {
        return `
          <a href="javascript:void(0)" class="edit-link" data-id="${params.data.id}">
            ✏️
          </a>
        `;
      }
    }
  ];

  brandCols: ColDef[] = [
     { 
    headerName: 'Sno', 
    width: 60,
    valueGetter: (params: any) => params.node.rowIndex + 1 // auto-increment
  },
    { headerName: 'Category Name', field: 'categoryName', filter: true ,width: 210},
     { headerName: 'Brand Name', field: 'brandName', filter: true ,width: 200},
    {
    headerName: 'Description',
    field: 'description',
    filter: false,
    width: 300,
    cellRenderer: (params: any) => {
      const words = params.value ? params.value.split(' ') : [];
      if (words.length > 200) {
        return words.slice(0, 150).join(' ') + '...';
      }
      return params.value;
    }
  },
    {
      headerName: 'Active',
      field: 'isDisable',
      filter: true,
      cellRenderer: (params: any) =>
        params.value==1
          ? '<span class="badge bg-success">Active</span>'
          : '<span class="badge bg-danger">Inactive</span>'
    },
    {
      headerName: 'Action',
      cellRenderer: (params: any) => {
        return `
          <a href="javascript:void(0)" class="edit-link" data-id="${params.data.id}">
            ✏️
          </a>
        `;
      }
    }
  ];

  planCols: ColDef[] = [
     { 
    headerName: 'Sno', 
    width: 60,
    valueGetter: (params: any) => params.node.rowIndex + 1 
  },
    { headerName: 'Category Name', field: 'categoryName', filter: true ,width: 150},
     { headerName: 'Plan Name', field: 'planName', filter: true ,width: 200},
    {
    headerName: 'Description',
    field: 'description',
    filter: false,
    width: 250,
    cellRenderer: (params: any) => {
      const words = params.value ? params.value.split(' ') : [];
      if (words.length > 250) {
        return words.slice(0, 150).join(' ') + '...';
      }
      return params.value;
    }
  },{
    headerName: 'Remark',
    field: 'remark',
    filter: false,
    width: 250,
    cellRenderer: (params: any) => {
      const words = params.value ? params.value.split(' ') : [];
      if (words.length > 250) {
        return words.slice(0, 150).join(' ') + '...';
      }
      return params.value;
    }
  },
    {
      headerName: 'Active',
      field: 'isDisable', width: 100,
      filter: true,
      cellRenderer: (params: any) =>
        params.value==1
          ? '<span class="badge bg-success">Active</span>'
          : '<span class="badge bg-danger">Inactive</span>'
    },
    {
      headerName: 'Action',    width: 150,
      cellRenderer: (params: any) => {
        return `
          <a href="javascript:void(0)" class="edit-link" data-id="${params.data.id}">
            ✏️
          </a>
        `;
      }
    }
  ];

setActiveTab(tab: string) {
  this.activeTab = tab;
  this.reloadData();
}

reloadData() {
  switch(this.activeTab) {
    case 'category':
   this.loadCategories(); 
      break;
    case 'brand':
      this.loadBrands(); 
      break;
    case 'plan':
      this.loadPlans(); 
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

 openAddPopup() {
    let dialogRef;
    switch (this.activeTab) {
      case 'category':
        dialogRef = this.dialog.open(CategoryFormComponent, { width: '800px' });
        break;
      case 'brand':
        dialogRef = this.dialog.open(BrandFormComponent, { width: '800px' });
        break;
      case 'plan':
        dialogRef = this.dialog.open(PlanFormComponent, { width: '800px' });
        break;
    }
    dialogRef?.afterClosed().subscribe(result => {
      if(result === 'success'){
        this.reloadData(); 
      }
    });
  }
  
}
