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
import { ApiService, CategoryDto, PlanDto } from '../services/api.service';
import { ToastService } from '../services/toastService.service';
import { Observable, of } from 'rxjs';
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
  planForm!: FormGroup;
  categories: CategoryDto[] = [];
  filteredcategories$!: Observable<CategoryDto[]>;
  title: string = 'Create Plan';
  submitBtnLabel: string = 'Submit Plan';
  mode: 'add' | 'edit' = 'add';

  private fb = inject(FormBuilder);
  private apiService = inject(ApiService);
  private toast = inject(ToastService);
  private dialogRef = inject(MatDialogRef<PlanFormComponent>);
  private data = inject(MAT_DIALOG_DATA) as { mode: 'add' | 'edit'; record?: PlanDto };

  ngOnInit(): void {
    this.planForm = this.fb.group({
      catId: [null, Validators.required],
      planName: ['', Validators.required],
      description: [''],
      remark: [''],
      isDisable: [true]
    });

    this.apiService.getCategories().subscribe(res => {
      this.categories = res.data;

      if (this.data) {
        this.mode = this.data.mode;
        this.title = this.mode === 'edit' ? 'Edit Plan' : 'Create Plan';
        this.submitBtnLabel = this.mode === 'edit' ? 'Update Plan' : 'Submit Plan';

        if (this.mode === 'edit' && this.data.record) {
          const record = this.data.record;
          const selectedCategory = this.categories.find(c => c.id === record.catId) ?? null;

          this.planForm.patchValue({
            catId: selectedCategory,
            planName: record.planName,
            description: record.description,
            remark: record.remark,
            isDisable: !!record.isDisable
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
    if (this.planForm.invalid) return;

    const formData = {
      ...this.planForm.value,
      catId: typeof this.planForm.value.catId === 'object'
        ? this.planForm.value.catId.id
        : this.planForm.value.catId,
      isDisable: this.planForm.value.isDisable ? true : false
    };

    if (this.mode === 'edit' && this.data.record) {
      this.apiService.updatePlan(this.data.record.id, formData).subscribe({
        next: () => {
          this.toast.success('Plan Updated Successfully!');
          this.dialogRef.close('success');
        },
        error: err => this.toast.error(err?.error || 'Error updating plan!')
      });
    } else {
      this.apiService.postPlans(formData).subscribe({
        next: () => {
          this.toast.success('Plan Created Successfully!');
          this.dialogRef.close('success');
        },
        error: err => this.toast.error(err?.error || 'Error creating plan!')
      });
    }
  }

  onClose() {
    this.dialogRef.close();
  }
}
