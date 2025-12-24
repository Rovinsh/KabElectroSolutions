import { Component,inject } from '@angular/core';
import { ApiService } from '../services/api.service';
import { ToastService } from '../services/toastService.service';
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

@Component({
  selector: 'app-close-with-or-without-repair-dialog', 
  templateUrl: './close-with-or-without-repair-dialog.html',
  styleUrl: './close-with-or-without-repair-dialog.css',
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
export class CloseWithOrWithoutRepairDialog {

  form: FormGroup;
  isLoading = false;

  remarkOptions: string[] = [
    'Calls cancelled',
    'Spares and other reasons',
    'Customer reasons'
  ];

  files: {
    jobSheet?: File;
    additional?: File;
    customerSatisfaction?: File;
  } = {};

  constructor(
    private fb: FormBuilder,
    private dialogRef: MatDialogRef<CloseWithOrWithoutRepairDialog>,private apiService: ApiService
  ) {
    this.form = this.fb.group({
  jobSheet: [null, Validators.required],
  additional: [null],
  customerSatisfaction: [null, Validators.required],
  remarks: ['', Validators.required]
    });
  }

  private data = inject(MAT_DIALOG_DATA) as {claimId:number, closeWithOrWithoutRepair: string };
  private toast = inject(ToastService);
   claimId =  this.data.claimId;
   closeWithOrWithoutRepair = this.data.closeWithOrWithoutRepair

  onFileChange(event: Event, controlName: string) {
    const file = (event.target as HTMLInputElement).files?.[0];
    if (file) {
      this.form.get(controlName)?.setValue(file);
      this.form.get(controlName)?.markAsTouched();
    }
  }

  submit() {
if (this.form.invalid) {
    this.form.markAllAsTouched();
    return;
  }

const formData = new FormData();
formData.append('claimId', this.claimId.toString());
formData.append('claimType', this.closeWithOrWithoutRepair);
formData.append('remarks', this.form.value.remarks);

formData.append('jobSheet', this.form.value.jobSheet);
formData.append('customerSatisfaction', this.form.value.customerSatisfaction);

if (this.form.value.additional) {
  formData.append('additional', this.form.value.additional);
}

  this.isLoading = true;
  this.apiService.CloseWithOrWithoutRepair(formData).subscribe({
    next: res => {
      this.toast.success('Claim closed successfully.!');
      this.dialogRef.close('success');
      this.isLoading = false;
    },
    error: err => {  this.toast.error('Something went wrong!');     
     this.isLoading = false;
    }
  });
  }

  close() {
    this.dialogRef.close();
  }
}
