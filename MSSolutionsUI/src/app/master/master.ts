import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ColDef } from 'ag-grid-community';
import { MatDialog, MatDialogModule } from '@angular/material/dialog';
import { AgGridModule } from 'ag-grid-angular';
import { CategoryFormComponent } from '../../app/category-form/category-form';
import { ShareEstimationComponent } from '../../app/share-estimation/share-estimation';
import { BrandFormComponent } from '../../app/brand-form/brand-form';
import { CouponFormComponent } from '../../app/coupon-form/coupon-form';
import { GstFormComponent } from '../../app/gst-form/gst-form';
import { ProductFormComponent } from '../../app/product-form/product-form';
import { ApiService, CategoryDto, BrandDto,CouponDto, GstDto,ProductDto } from '../services/api.service';
import { ModuleRegistry, AllCommunityModule } from 'ag-grid-community';
ModuleRegistry.registerModules([AllCommunityModule]);

@Component({
  selector: 'app-master',
  standalone: true,
  imports: [CommonModule, MatDialogModule, AgGridModule],
  templateUrl: './master.html',
  styleUrls: ['./master.css']
})
export class MasterComponent implements OnInit {
  isLoading = false;
  activeTab: string = 'category';
  categories: CategoryDto[] = [];
  brands: BrandDto[] = [];
  coupons: CouponDto[] = [];
  gst: GstDto[] = [];
  product: ProductDto[] = [];
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
      case 'coupon':
        this.loadCoupons();
        break;
      case 'gst':
        this.loadGst();
        break;
      case 'product':
        this.loadProduct();
        break;
    }
  }

  loadCategories() {this.isLoading = true;
    this.apiService.getCategories().subscribe(res => {
      this.categories = res.data.sort((a: any, b: any) => a.catName.localeCompare(b.catName));
      this.isLoading = false;
    });
  }

  loadBrands() {this.isLoading = true;
    this.apiService.getBrands().subscribe(res => {
      this.brands = res.data.sort((a: any, b: any) => a.brandName.localeCompare(b.brandName));
       this.isLoading = false;
    });
  }

loadCoupons() {
  this.isLoading = true;

  this.apiService.getCoupon().subscribe({
    next: res => {
      this.coupons = (res.data || [])
        .map((c: any) => ({
          ...c,
          couponStartDate: this.formatDate(c.couponStartDate),
          couponEndDate: this.formatDate(c.couponEndDate)
        }))
        .sort((a: any, b: any) => a.couponCode.localeCompare(b.couponCode));

      this.isLoading = false;
    },
    error: err => {
      console.error(err);
      this.isLoading = false;
    }
  });
}

formatDate(value: string): string {
  if (!value) return '';
  const d = new Date(value);
  return d.toLocaleDateString('en-GB', {
    day: '2-digit',
    month: '2-digit',
    year: '2-digit'
  });
}
loadGst() {this.isLoading = true;
    this.apiService.getGst().subscribe(res => {
    this.gst = res.data.sort((a: any, b: any) => a.gstValue.localeCompare(b.gstValue));
    this.isLoading = false;
  });
  }
  
 loadProduct() {this.isLoading = true;
    this.apiService.getProduct().subscribe(res => {
    this.product = res.data.sort((a: any, b: any) => a.productName.localeCompare(b.productName));
    this.isLoading = false;
  });
  }

  openImagePopup(data?: any) {
  const isEdit = !!data; 
  let dialogRef;
 dialogRef = this.dialog.open(ShareEstimationComponent, {
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
  

  dialogRef?.afterClosed().subscribe(result => {
    if (result === 'success') {
      this.reloadData();
    }
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
    case 'coupon':
      dialogRef = this.dialog.open(CouponFormComponent, {
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
      case 'gst':
      dialogRef = this.dialog.open(GstFormComponent, {
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
      case 'product':
      dialogRef = this.dialog.open(ProductFormComponent, {
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
    }else if (event.colDef.headerName === 'Image' && event.event.target.classList.contains('image-link')) {
      this.openImagePopup(event.data); 
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
    { headerName: 'Brand Name', field: 'brandName', filter: true, width: 230 },
    { headerName: 'Category Name', field: 'categoryName', filter: true, width: 210 },
    {
      headerName: 'Description',
      field: 'description',
      filter: false,
      width: 180,
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

 gstCols: ColDef[] = [
    { headerName: 'Sno', width: 60, valueGetter: (params: any) => params.node.rowIndex + 1 },
    { headerName: 'Name %', field: 'gstValue', filter: true, width: 250 },
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

 couponCols: ColDef[] = [
    { headerName: 'Sno', width: 60, valueGetter: (params: any) => params.node.rowIndex + 1 },
    { headerName: 'Coupon Title', field: 'couponTitle', filter: true, width: 200 },
    { headerName: 'Coupon Code', field: 'couponCode', filter: true, width: 150 },
    { headerName: 'Discount Type', field: 'discountType', filter: true, width: 110 },
    { headerName: 'Coupon Amount', field: 'couponAmount', filter: true, width: 110 },
    { headerName: 'Coupon Start Date', field: 'couponStartDate', filter: true, width: 110 },
    { headerName: 'Coupon End Date', field: 'couponEndDate', filter: true, width: 110 },
    {
      headerName: 'Description',
      field: 'description',
      filter: false,
      width: 150,
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
      headerName: 'All Products',
      field: 'isAllProducts',
      filter: true,
      width: 100,
      cellRenderer: (params: any) =>
        params.value == 1
          ? '<span class="badge bg-success">Active</span>'
          : '<span class="badge bg-danger">Inactive</span>'
    },
    {
      headerName: 'First Order',
      field: 'isFirstOrder',
      filter: true,
      width: 100,
      cellRenderer: (params: any) =>
        params.value == 1
          ? '<span class="badge bg-success">Active</span>'
          : '<span class="badge bg-danger">Inactive</span>'
    },
    {
      headerName: 'Expired',
      field: 'isExpired',
      filter: true,
      width: 100,
      cellRenderer: (params: any) =>
        params.value == 1
          ? '<span class="badge bg-success">Active</span>'
          : '<span class="badge bg-danger">Inactive</span>'
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

productCols: ColDef[] = [
  { headerName: 'Sno', width: 60, valueGetter: (params: any) => params.node.rowIndex + 1 },
  { headerName: 'Product Name', field: 'productName', filter: true, width: 200 },
  { headerName: 'SKU', field: 'sku', filter: true, width: 120 },
  { headerName: 'Category', field: 'categoryName', filter: true, width: 150 },
  { headerName: 'Brand', field: 'brandName', filter: true, width: 150 },
  { headerName: 'Base Price', field: 'baseAmount', filter: true, width: 110 },
  { headerName: 'GST %', field: 'gstPercentage', filter: true, width: 80 },
  { headerName: 'GST Amount', field: 'gstAmount', filter: true, width: 110 },
  { headerName: 'Discount Price', field: 'discountPrice', filter: true, width: 110 },
  { headerName: 'Final Price', field: 'withGstAmount', filter: true, width: 120 },
  { headerName: 'Stock', field: 'stockQty', filter: true, width: 90 },
  {
      headerName: 'Description',
      field: 'description',
      filter: false,
      width: 150,
      cellRenderer: (params: any) => {
        const words = params.value ? params.value.split(' ') : [];
        if (words.length > 150) return words.slice(0, 150).join(' ') + '...';
        return params.value;
      }
    },
    {
      headerName: 'Short Description',
      field: 'shortDescription',
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
    field: 'isActive',
    filter: true,
    width: 100,
    cellRenderer: (params: any) =>
      params.value == false || params.value == 0
        ? '<span class="badge bg-success">Active</span>'
        : '<span class="badge bg-danger">Inactive</span>'
  },

  {
    headerName: 'Action',
    width: 100,
    cellRenderer: (params: any) =>
      `<a href="javascript:void(0)" class="edit-link" data-id="${params.data.id}">✏️</a>`
  },
  {
    headerName: 'Image',
    width: 100,
    cellRenderer: (params: any) =>
      `<a href="javascript:void(0)" class="image-link" data-id="${params.data.id}">🖼️</a>`
  }
];


}
