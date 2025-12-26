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
import { ApiService, CouponDto } from '../services/api.service';
import { ToastService } from '../services/toastService.service';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { MatNativeDateModule } from '@angular/material/core';

@Component({
  selector: 'app-coupon-form',
  standalone: true,
  imports: [
    ReactiveFormsModule,
    MatFormFieldModule,
    MatInputModule,
    MatButtonModule,
    MatDatepickerModule,
    MatNativeDateModule,
    MatCardModule,
    MatCheckboxModule,
    MatSelectModule,
    MatAutocompleteModule,
    CommonModule
  ],
  templateUrl: './coupon-form.html',
  styleUrls: ['./coupon-form.css']
})
export class CouponFormComponent implements OnInit {
  isSubmitting = false;
  couponForm!: FormGroup;
  title = 'Create Coupon';
  submitBtnLabel = 'Submit Coupon';
  mode: 'add' | 'edit' = 'add';

  private fb = inject(FormBuilder);
  private apiService = inject(ApiService);
  private toast = inject(ToastService);
  private dialogRef = inject(MatDialogRef<CouponFormComponent>);
  private data = inject(MAT_DIALOG_DATA) as { mode: 'add' | 'edit'; record?: CouponDto };

  ngOnInit(): void {
    this.initForm();

    if (this.data?.mode === 'edit' && this.data.record) {
      this.mode = 'edit';
      this.title = 'Edit Coupon';
      this.submitBtnLabel = 'Update Coupon';
      this.patchEditData();
    }
  }

  private initForm(): void {
    this.couponForm = this.fb.group({
      couponTitle: ['', Validators.required],
      couponCode: ['', Validators.required],
      discountType: ['', Validators.required],
      couponAmount: [null, Validators.required],
      couponStartDate: ['', Validators.required],
      couponEndDate: ['', Validators.required],
      description: [''],
      remark: [''],
      isExpired: [false],
      isFirstOrder: [false],
      isAllProducts: [false],
      isDisable: [true]
    });
  }

  private patchEditData(): void {
    const record = this.data.record!;
    this.couponForm.patchValue({
      couponTitle: record.couponTitle,
      couponCode: record.couponCode,
      discountType: record.discountType,
      couponAmount: record.couponAmount,
      couponStartDate: this.parseDDMMYY(record.couponStartDate),
      couponEndDate: this.parseDDMMYY(record.couponEndDate),
      description: record.description,
      remark: record.remark,
      isExpired: record.isExpired,
      isFirstOrder: record.isFirstOrder,
      isAllProducts: record.isAllProducts,
      isDisable: record.isDisable
    });
  }

 private parseDDMMYY(dateStr: string): Date | null {
  if (!dateStr) return null;

  const parts = dateStr.split('/');
  if (parts.length !== 3) return null;

  const day = +parts[0];
  const month = +parts[1] - 1; // Month is 0-based
  let year = +parts[2];

  // Convert 2-digit year to 20xx
  year += year < 100 ? 2000 : 0;

  return new Date(year, month, day);
}
  onSubmit(): void {
    if (this.couponForm.invalid) {
      this.toast.error('Please fill all required fields correctly.');
      return;
    }

    const formData = this.couponForm.value;
     const formDataload = {
    ...formData,
    couponStartDate: new Date(formData.couponStartDate).toISOString(),
    couponEndDate: new Date(formData.couponEndDate).toISOString()
  };

    this.isSubmitting = true;

    const handleError = (err: any, action: string) => {
      this.isSubmitting = false;
      if (err?.status === 409) {
        this.toast.error('A coupon with the same title or code already exists!');
      } else {
        this.toast.error(`Error ${action} coupon.`);
      }
    };

    if (this.mode === 'edit' && this.data.record) {
      this.apiService.updateCoupon(this.data.record.id, formDataload).subscribe({
        next: () => {
          this.isSubmitting = false;
          this.toast.success('Coupon updated successfully!');
          this.dialogRef.close('success');
        },
        error: err => handleError(err, 'updating')
      });
    } else {
      this.apiService.postCoupon(formDataload).subscribe({
        next: () => {
          this.isSubmitting = false;
          this.toast.success('Coupon created successfully!');
          this.dialogRef.close('success');
        },
        error: err => handleError(err, 'creating')
      });
    }
  }

  onClose(): void {
    this.dialogRef.close();
  }
}
