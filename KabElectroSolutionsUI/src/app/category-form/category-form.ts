import { Component, OnInit, inject } from '@angular/core';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { ApiService, CategoryDto } from '../services/api.service';
import { ToastService } from '../services/toastService.service';

@Component({
  selector: 'app-category-form-component',
  standalone: true,
  imports: [
    CommonModule,
    ReactiveFormsModule,
    MatFormFieldModule,
    MatInputModule,
    MatButtonModule,
    MatCardModule,
    MatCheckboxModule
  ],
  templateUrl: './category-form.html',
  styleUrls: ['./category-form.css']
})
export class CategoryFormComponent implements OnInit {
  categoryForm!: FormGroup;
  title: string = 'Create Category';
  submitBtnLabel: string = 'Submit Category';
  mode: 'add' | 'edit' = 'add';

  private fb = inject(FormBuilder);
  private apiService = inject(ApiService);
  private toast = inject(ToastService);
  private dialogRef = inject(MatDialogRef<CategoryFormComponent>);
  private data = inject(MAT_DIALOG_DATA) as { mode: 'add' | 'edit'; record?: CategoryDto };

  ngOnInit(): void {
    this.categoryForm = this.fb.group({
      catName: ['', Validators.required],
      description: [null],
      isDisable: [true]
    });

    if (this.data) {
      this.mode = this.data.mode;
      this.title = this.mode === 'edit' ? 'Edit Category' : 'Create Category';
      this.submitBtnLabel = this.mode === 'edit' ? 'Update Category' : 'Submit Category';

      if (this.mode === 'edit' && this.data.record) {
        this.categoryForm.patchValue({
          catName: this.data.record.catName,
          description: this.data.record.description,
          isDisable: !!this.data.record.isDisable
        });
      }
    }
  }

  onSubmit(): void {
  if (this.categoryForm.invalid) return;

  const formData = {
    ...this.categoryForm.value,
    isDisable: this.categoryForm.value.isDisable ? true : false
  };

  const handleError = (err: any) => {
    if (err.status === 409) {
      this.toast.error('Category name already exists!');
    } else {
      this.toast.error(err?.error || 'An error occurred!');
    }
  };

  if (this.mode === 'edit' && this.data.record) {

    this.apiService.updateCategory(this.data.record.id, formData).subscribe({
      next: () => {
        this.toast.success('Category Updated Successfully!');
        this.dialogRef.close('success');
      },
      error: handleError
    });

  } else {

    this.apiService.postCategory(formData).subscribe({
      next: () => {
        this.toast.success('Category Created Successfully!');
        this.dialogRef.close('success');
      },
      error: handleError
    });

  }
}

  onClose() {
    this.dialogRef.close();
  }
}
