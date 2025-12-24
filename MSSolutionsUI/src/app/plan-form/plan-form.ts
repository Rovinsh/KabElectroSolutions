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
import { ApiService, BrandDto, CategoryDto, PlanDto } from '../services/api.service';
import { ToastService } from '../services/toastService.service';
import { forkJoin, map, Observable, of, startWith } from 'rxjs';
import { ModuleRegistry, AllCommunityModule } from 'ag-grid-community';
ModuleRegistry.registerModules([AllCommunityModule]);

@Component({
  selector: 'app-plan-form',
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
  templateUrl: './plan-form.html',
  styleUrls: ['./plan-form.css']
})
export class PlanFormComponent implements OnInit {
  isSubmitting = false;
  planForm!: FormGroup;

  categories: CategoryDto[] = [];
  brands: BrandDto[] = [];
  filteredcategories$!: Observable<CategoryDto[]>;
  filteredBrands$!: Observable<BrandDto[]>;
  selectedCategory: number | null = null;
  selectedBrand: number | null = null;

  title: string = 'Create Plan';
  submitBtnLabel: string = 'Submit Plan';
  mode: 'add' | 'edit' = 'add';

  private fb = inject(FormBuilder);
  private apiService = inject(ApiService);
  private toast = inject(ToastService);
  private dialogRef = inject(MatDialogRef<PlanFormComponent>);
  private data = inject(MAT_DIALOG_DATA) as { mode: 'add' | 'edit'; record?: PlanDto };

  ngOnInit(): void {

    // === Form initialization ===
    this.planForm = this.fb.group({
      catId: [null, Validators.required],
      brandId: [null, Validators.required],
      planName: ['', Validators.required],
      description: [''],
      remark: [''],
      isDisable: [true]
    });

     forkJoin({
          category: this.apiService.getCategories(),
          brand: this.apiService.getBrands()
        }).subscribe({
          next: (result) => {
            this.categories = result.category.data.filter(x => x.isDisable) ?? result.category;
            this.brands = result.brand.data.filter(x => x.isDisable) ?? result.brand; 
            this.setupAutocompleteFilters();
            if (this.data.mode === 'edit') {
              this.mode = 'edit';
              this.title = 'Edit Plan';
              this.submitBtnLabel = 'Update Plan';
              this.patchEditData();
            }
          }
        });  
      }
    private patchEditData() {
    const record = this.data.record!;

    const categoryObj = this.categories.find(s => s.id === record.catId) || null;
    const brandObj = this.brands.find(c => c.id === record.brandId) || null;

  this.selectedCategory = record.catId;
  this.showBrand();
  this.selectedBrand = record.brandId;

      this.planForm.patchValue({
            catId: categoryObj,
            brandId: brandObj,
            planName: record.planName,
            description: record.description,
            remark: record.remark,
            isDisable: !!record.isDisable
          });

  }

   private setupAutocompleteFilters() {
  
     this.filteredcategories$ = this.planForm.get('catId')!.valueChanges.pipe(
  startWith(''),
  map(value => typeof value === 'string' ? value : value?.catName || ''),
  map(catName => catName
    ? this.categories.filter(st =>
        st.catName.toLowerCase().includes(catName.toLowerCase())
      )
    : this.categories
  )
);
  
      this.filteredBrands$ = this.planForm.get('brandId')!.valueChanges.pipe(
        startWith(''),
        map(value => typeof value === 'string' ? value : value?.brandName || ''),
        map(brandName => this.brands.filter(c => 
   c.categoryId === this.selectedCategory &&
   c.brandName.toLowerCase().includes(brandName.toLowerCase())
))
      );
    }
  displayCategory(category: CategoryDto | null) { return category?.catName ?? ''; }
  displayBrand(brand: BrandDto | null) { return brand?.brandName ?? ''; }
  showCategory() {
    this.filteredcategories$ = of(this.categories);
  }
  showBrand() {  this.filteredBrands$ = of(
    this.brands.filter(b => b.categoryId === this.selectedCategory)
  );}

 onCategorySelected(s: CategoryDto) {
    this.selectedCategory = s.id;
    this.selectedBrand = null;
    this.planForm.patchValue({ brandId: null});
    this.showBrand();
  }

  onBrandSelected(c: BrandDto) {
    this.selectedBrand = c.id;
  }

  onSubmit(): void {
     if (this.planForm.invalid) {
      this.toast.error('Please fill all required fields correctly.');
      return;
    }

    const formData = {
      ...this.planForm.value,

      catId:
        typeof this.planForm.value.catId === 'object'
          ? this.planForm.value.catId.id
          : this.planForm.value.catId,

      brandId:
        typeof this.planForm.value.brandId === 'object'
          ? this.planForm.value.brandId.id
          : this.planForm.value.brandId,

      isDisable: this.planForm.value.isDisable ? true : false
    };

    this.isSubmitting = true;

    const handleError = (err: any, action: string) => {
      this.isSubmitting = false;
      if (err?.status === 409) {
        this.toast.error("A plan with the same name already exists in this category and brand!");
      } else if (err?.error) {
        this.toast.error(err.error);
      } else {
        this.toast.error(`Error ${action} plan!`);
      }
    };

    if (this.mode === 'edit' && this.data.record) {
      this.apiService.updatePlan(this.data.record.id, formData).subscribe({
        next: () => {
          this.isSubmitting = false;
          this.toast.success('Plan Updated Successfully!');
          this.dialogRef.close('success');
        },
        error: err => handleError(err, 'updating')
      });
    } else {
      this.apiService.postPlans(formData).subscribe({
        next: () => {
          this.isSubmitting = false;
          this.toast.success('Plan Created Successfully!');
          this.dialogRef.close('success');
        },
        error: err => handleError(err, 'creating')
      });
    }
  }

  onClose() {
    this.dialogRef.close();
  }
}
