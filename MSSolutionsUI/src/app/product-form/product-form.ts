import { Component, OnInit, inject } from '@angular/core';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { MatAutocompleteModule } from '@angular/material/autocomplete';
import { MatSelectModule } from '@angular/material/select';
import { ApiService, BrandDto, CategoryDto,GstDto, ProductDto } from '../services/api.service';
import { ToastService } from '../services/toastService.service';
import { forkJoin, map, Observable, of, startWith } from 'rxjs';

@Component({
  selector: 'app-product-form',
  standalone: true,
  imports: [
    ReactiveFormsModule,
    MatFormFieldModule,
    MatInputModule,
    MatButtonModule,
    MatCardModule,
    MatCheckboxModule,
    MatSelectModule,
    MatAutocompleteModule,
    CommonModule
  ],
  templateUrl: './product-form.html',
  styleUrls: ['./product-form.css']
})
export class ProductFormComponent implements OnInit {
  isSubmitting = false;
  productForm!: FormGroup;

  categories: CategoryDto[] = [];
  brands: BrandDto[] = [];
  gst: GstDto[] = [];
  filteredcategories$!: Observable<CategoryDto[]>;
  filteredBrands$!: Observable<BrandDto[]>;
  filteredGsts$!: Observable<GstDto[]>;
  selectedCategory: number | null = null;
  selectedBrand: number | null = null;
  selectedGst: number | null = null;  
  title: string = 'Create Product';
  submitBtnLabel: string = 'Submit Product';
  mode: 'add' | 'edit' = 'add';

  private fb = inject(FormBuilder);
  private apiService = inject(ApiService);
  private toast = inject(ToastService);
  private dialogRef = inject(MatDialogRef<ProductFormComponent>);
  private data = inject(MAT_DIALOG_DATA) as { mode: 'add' | 'edit'; record?: ProductDto };

  ngOnInit(): void {

    // === Form initialization ===
    this.productForm= this.fb.group({
      productName: ['', Validators.required],
      sku: [''],
      categoryId: [null, Validators.required],
      brandId: [null, Validators.required],
      baseAmount: [0, Validators.required],
      gstId: [0, Validators.required],
      gstPercentage: [0],
      gstAmount: [{ value: 0, disabled: true }],
      withGstAmount: [{ value: 0, disabled: true }],
      stockQty: [0],
      discountPrice: [0],
      shortDescription: [''],
      description: [''],
      productCovered: [''],
      noOfDevicesCovered: [''],
      servicesPeriod: [''],
      whentoPurchase: [''],
      servicesCoverFeature: [''],
      servicesAvilableFrom: [''],
      isActive: [false]
    });

     forkJoin({
          category: this.apiService.getCategories(),
          brand: this.apiService.getBrands(),
          gst: this.apiService.getGst()
        }).subscribe({
          next: (result) => {
            this.categories = result.category.data.filter(x => x.isDisable) ?? result.category;
            this.brands = result.brand.data.filter(x => x.isDisable) ?? result.brand; 
             this.gst = result.gst.data.filter(x => x.isDisable) ?? result.gst; 
            this.setupAutocompleteFilters();
            if (this.data.mode === 'edit') {
              this.mode = 'edit';
              this.title = 'Edit Product';
              this.submitBtnLabel = 'Update Product';
              this.patchEditData();
            }
          }
        });  
        
  this.productForm.get('baseAmount')!.valueChanges.subscribe(() => {
    this.recalculateGst();
  });

  this.productForm.get('gstPercentage')!.valueChanges.subscribe(() => {
    this.recalculateGst();
  });
      }
 private patchEditData() {
  const record = this.data.record!;

  const categoryObj = this.categories.find(c => c.id === record.categoryId) || null;
  const brandObj = this.brands.find(b => b.id === record.brandId) || null;
  const gstObj = this.gst.find(g => g.id === record.gstId) || null;

  this.selectedCategory = record.categoryId;
  this.selectedBrand = record.brandId;
  this.selectedGst = record.gstId;

  this.showBrand();
  this.showGst();

  this.productForm.patchValue({
    categoryId: categoryObj,
    brandId: brandObj,
    gstId: gstObj,
    baseAmount: record.baseAmount,
    sku: record.sku,
    productName: record.productName,
    gstAmount: record.gstAmount,
    gstPercentage: record.gstPercentage,
    stockQty: record.stockQty,
    discountPrice: record.discountPrice,
    description: record.description,
    shortDescription: record.shortDescription,
    productCovered: record.productCovered,
    noOfDevicesCovered: record.noOfDevicesCovered,
    servicesPeriod: record.servicesPeriod,
    whentoPurchase: record.whentoPurchase,
    servicesCoverFeature: record.servicesCoverFeature,
    servicesAvilableFrom: record.servicesAvilableFrom,
    isActive: record.isActive
  });
}
   private setupAutocompleteFilters() {
  
     this.filteredcategories$ = this.productForm.get('categoryId')!.valueChanges.pipe(
  startWith(''),
  map(value => typeof value === 'string' ? value : value?.catName || ''),
  map(catName => catName
    ? this.categories.filter(st =>
        st.catName.toLowerCase().includes(catName.toLowerCase())
      )
    : this.categories
  )
);
  
   this.filteredBrands$ = this.productForm.get('brandId')!.valueChanges.pipe(
  startWith(''),
  map(value => typeof value === 'string' ? value : value?.brandName || ''),
  map(name => this.brands.filter(b =>
    (!this.selectedCategory || b.categoryId === this.selectedCategory) &&
    b.brandName.toLowerCase().includes(name.toLowerCase())
  ))
);

this.filteredGsts$ = this.productForm.get('gstId')!.valueChanges.pipe(
  startWith(''),
  map(value => typeof value === 'string' ? value : value?.gstValue || ''),
  map(val => this.gst.filter(g =>
    g.gstValue.toLowerCase().includes(val.toLowerCase())
  )));
    }
  displayCategory(category: CategoryDto | null) { return category?.catName ?? ''; }
  displayBrand(brand: BrandDto | null) { return brand?.brandName ?? ''; }
  displayGst(gst: GstDto | null) { return gst?.gstValue ?? ''; }
  showCategory() {
    this.filteredcategories$ = of(this.categories);
  }
  showBrand() {  this.filteredBrands$ = of(
    this.brands.filter(b => b.categoryId === this.selectedCategory)
  );}
showGst() {
  this.filteredGsts$ = of(this.gst);
}
onCategorySelected(c: CategoryDto) {
  this.selectedCategory = c.id;
  this.selectedBrand = null;
  this.productForm.patchValue({ brandId: null });
  this.showBrand();
}

onGstSelected(g: GstDto) {
  this.selectedGst = g.id;

  this.productForm.patchValue({
    gstId: g,
    gstPercentage: Number(g.gstValue) || 0
  });

  this.recalculateGst();
}
  onBrandSelected(c: BrandDto) {
    this.selectedBrand = c.id;
  }

  onSubmit(): void {
     if (this.productForm.invalid) {
      this.toast.error('Please fill all required fields correctly.');
      return;
    }

  const raw = this.productForm.getRawValue();

const formData = {
  ...raw,
  categoryId: raw.categoryId?.id ?? raw.categoryId,
  brandId: raw.brandId?.id ?? raw.brandId,
  gstId: raw.gstId?.id ?? raw.gstId,
  isActive: raw.isActive
};

    this.isSubmitting = true;

    const handleError = (err: any, action: string) => {
      this.isSubmitting = false;
      if (err?.status === 409) {
        this.toast.error("A product with the same sku already exists!");
      } else if (err?.error) {
        this.toast.error(err.error);
      } else {
        this.toast.error(`Error ${action} product!`);
      }
    };

    if (this.mode === 'edit' && this.data.record) {
      this.apiService.updateProduct(this.data.record.id, formData).subscribe({
        next: () => {
          this.isSubmitting = false;
          this.toast.success('Product Updated Successfully!');
          this.dialogRef.close('success');
        },
        error: err => handleError(err, 'updating')
      });
    } else {
      this.apiService.postProduct(formData).subscribe({
        next: () => {
          this.isSubmitting = false;
          this.toast.success('Product Created Successfully!');
          this.dialogRef.close('success');
        },
        error: err => handleError(err, 'creating')
      });
    }
  }
 recalculateGst() {
  const base = Number(this.productForm.get('baseAmount')?.value || 0);
  const discount = Number(this.productForm.get('discountPrice')?.value || 0);
  const gstPercent = Number(this.productForm.get('gstPercentage')?.value || 0);
  const taxableAmount = Math.max(base - discount, 0);
  const gstAmount = +(taxableAmount * gstPercent / 100).toFixed(2);
  const withGst = +(taxableAmount + gstAmount).toFixed(2);

  this.productForm.patchValue({
    gstAmount,
    withGstAmount: withGst
  }, { emitEvent: false });
}
  onClose() {
    this.dialogRef.close();
  }
}
