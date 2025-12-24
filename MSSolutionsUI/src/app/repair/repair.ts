import { Component, inject } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule } from '@angular/forms';

import { MatDialogModule } from '@angular/material/dialog';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatSelectModule } from '@angular/material/select';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { MatNativeDateModule } from '@angular/material/core';
import { ApiService } from '../services/api.service';
import { ToastService } from '../services/toastService.service';

@Component({
  selector: 'app-repair-dialog',
  standalone: true,
  templateUrl: './repair.html',
  styleUrls: ['./repair.css'],
  imports: [
    CommonModule,
    ReactiveFormsModule,
    MatDialogModule,
    MatFormFieldModule,
    MatInputModule,
    MatSelectModule,
    MatButtonModule,
    MatIconModule,
    MatDatepickerModule,
    MatNativeDateModule
  ]
})
export class RepairDialogComponent {

  form: FormGroup;
  showReason = false;
  reasonList: string[] = [];
  isLoading = false;

  // 🔹 Mapping Select → Reasons
  reasonMap: Record<string, string[]> = {
    "Repair Started at Customer's Home": [
      'Set under repair',
      'Set under observation',
      'Observation Completed'
    ],
    'Repair Started at Service Center': [
      'Customer re-scheduled delivery',
      'ASC re-scheduled delivery',
      'Re-scheduled due to other reasons',
      'Product dispatched to customer'
    ]
  };

  constructor(
    private fb: FormBuilder,
    private dialogRef: MatDialogRef<RepairDialogComponent>,private apiService: ApiService
  ) {
    this.form = this.fb.group({
      repairedAt: ['', Validators.required],
      remarks: [''],
      closeDate: ['', Validators.required],
      reason: ['']
    });

    // 🔥 Dependent dropdown logic
    this.form.get('repairedAt')?.valueChanges.subscribe(value => {
      const reasonCtrl = this.form.get('reason');

      if (value && this.reasonMap[value]) {
        this.showReason = true;
        this.reasonList = this.reasonMap[value];
        reasonCtrl?.setValidators([Validators.required]);
        reasonCtrl?.reset();
      } else {
        this.showReason = false;
        this.reasonList = [];
        reasonCtrl?.clearValidators();
        reasonCtrl?.reset();
      }

      reasonCtrl?.updateValueAndValidity();
    });
  }

  private data = inject(MAT_DIALOG_DATA) as {claimId:number };
  private toast = inject(ToastService);
   claimId =  this.data.claimId;

  submit() {
    if (this.form.invalid) return;
    if (this.form.valid) {
      this.isLoading = true;
      const payload = {
        claimId: this.claimId,   // 👈 pass from dialog data
        repairedAt: this.form.value.repairedAt,
        reason: this.form.value.reason,
        remarks: this.form.value.remarks,
        closureDate: this.formatDate(this.form.value.closeDate)
      };
      this.apiService.repairClaim(payload).subscribe({
        next: res => {
          this.toast.success('Repair details saved successfully.!');
          this.dialogRef.close('success');
          this.isLoading = false;
        },
        error: err => {
          this.toast.error('Something went wrong!');
          this.isLoading = false;
        }
      });

      //this.dialogRef.close(this.form.value);
    }
  }

  private formatDate(date: Date): string {
  return date.toISOString().split('T')[0];
}
  close() {
    this.dialogRef.close();
  }
}
