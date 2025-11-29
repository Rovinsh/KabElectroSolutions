import { Component, OnInit, inject } from '@angular/core';
import { ReactiveFormsModule, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { MatSelectModule } from '@angular/material/select';
import { MatAutocompleteModule } from '@angular/material/autocomplete';
import { Observable, of } from 'rxjs';
import { ApiService, CategoryDto, BrandDto } from '../services/api.service';
import { ToastService } from '../services/toastService.service';

@Component({
  selector: 'app-brand-form',
  standalone: true,
  imports: [
    CommonModule,
    ReactiveFormsModule,
    MatFormFieldModule,
    MatInputModule,
    MatButtonModule,
    MatCardModule,
    MatCheckboxModule,
    MatSelectModule,
    MatAutocompleteModule
  ],
  templateUrl: './brand-form.html',
  styleUrls: ['./brand-form.css']
})
export class BrandFormComponent implements OnInit {
  brandForm!: FormGroup;
  categories: CategoryDto[] = [];
  filteredcategories$!: Observable<CategoryDto[]>;
  title: string = 'Create Brand';
  submitBtnLabel: string = 'Submit Brand';
  mode: 'add' | 'edit' = 'add';

  private fb = inject(FormBuilder);
  private apiService = inject(ApiService);
  private toast = inject(ToastService);
  private dialogRef = inject(MatDialogRef<BrandFormComponent>);
  private data = inject(MAT_DIALOG_DATA) as { mode: 'add' | 'edit'; record?: BrandDto };

  ngOnInit(): void {
    this.brandForm = this.fb.group({
      categoryId: [null, Validators.required],
      brandName: ['', Validators.required],
      description: [''],
      isDisable: [true]
    });

    this.apiService.getCategories().subscribe(res => {
      this.categories = res.data.filter(x => x.isDisable);

      if (this.data) {
        this.mode = this.data.mode;
        this.title = this.mode === 'edit' ? 'Edit Brand' : 'Create Brand';
        this.submitBtnLabel = this.mode === 'edit' ? 'Update Brand' : 'Submit Brand';

       if (this.mode === 'edit' && this.data?.record) {
        const selectedCategory = this.categories.find(c => c.id === this.data.record?.categoryId) ?? null;

        this.brandForm.patchValue({
          categoryId: selectedCategory,
          brandName: this.data.record.brandName,
          description: this.data.record.description,
          isDisable: !!this.data.record.isDisable
        });
      }
      }
    });
  }

  showAllCategoriesTypes() {
    this.filteredcategories$ = of(this.categories);
  }

  displayCategoryName(category: CategoryDto | null): string {
    return category ? category.catName : '';
  }

 onSubmit(): void {
  if (this.brandForm.invalid) return;

  const formData = {
    ...this.brandForm.value,
    isDisable: this.brandForm.value.isDisable ? true : false,
    categoryId: this.brandForm.value.categoryId?.id ?? this.brandForm.value.categoryId
  };

  const handleError = (err: any, action: string) => {
    if (err?.status === 409) {
      this.toast.error("A Brand with the same name already exists in this category!");
    } 
    else if (err?.error) {
      this.toast.error(err.error);
    } 
    else {
      this.toast.error(`Error ${action} brand!`);
    }
  };

  if (this.mode === 'edit' && this.data.record) {
    this.apiService.updateBrand(this.data.record.id, formData).subscribe({
      next: () => {
        this.toast.success('Brand Updated Successfully!');
        this.dialogRef.close('success');
      },
      error: (err) => handleError(err, 'updating')
    });
  } else {
    this.apiService.postBarands(formData).subscribe({
      next: () => {
        this.toast.success('Brand Created Successfully!');
        this.dialogRef.close('success');
      },
      error: (err) => handleError(err, 'creating')
    });
  }
}

  onClose() {
    this.dialogRef.close();
  }
}
