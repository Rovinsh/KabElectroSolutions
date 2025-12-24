import { Component, inject } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule } from '@angular/forms';
import { MatDialogModule, MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { MatNativeDateModule } from '@angular/material/core';
import { ToastService } from '../services/toastService.service';
import { ApiService } from '../services/api.service';
@Component({
  selector: 'app-invoice-dialog',
  templateUrl: './invoice-dialog.html',
  styleUrls: ['./invoice-dialog.css'],
  imports: [
    CommonModule,
    ReactiveFormsModule,

    MatDialogModule,
    MatFormFieldModule,
    MatInputModule,
    MatButtonModule,
    MatIconModule,
    MatDatepickerModule,
    MatNativeDateModule
  ]
})
export class InvoiceDialogComponent {

  form: FormGroup;
  selectedFile: File | null = null;
  fileTouched = false;
  isLoading = false;

  constructor(
    private fb: FormBuilder,
    private dialogRef: MatDialogRef<InvoiceDialogComponent>,private apiService: ApiService
  ) {
    this.form = this.fb.group({
  invoiceDate: [null, Validators.required],
  invoiceNumber: ['', Validators.required],
  taxAmount: ['', Validators.required],
  billAmountBeforeTax: ['', Validators.required],
  totalBillAmount: ['', Validators.required],
  remarks: [''],
  isRejected: [false],
  invoiceImage: [null, Validators.required]   // ✅ REQUIRED
});
  }
   private data = inject(MAT_DIALOG_DATA) as {claimId:number, closeWithOrWithoutRepair: string };
    private toast = inject(ToastService);
     claimId =  this.data.claimId;

 onFileChange(event: Event) {
  const input = event.target as HTMLInputElement;
  const file = input.files?.[0];

  this.fileTouched = true;

  if (!file) return;

  this.selectedFile = file;
  this.form.patchValue({ invoiceImage: file });
  this.form.get('invoiceImage')?.markAsTouched();
}

removeFile() {
  this.selectedFile = null;
  this.form.patchValue({ invoiceImage: null });
  this.form.get('invoiceImage')?.markAsTouched();
}

  submit() {
    if (this.form.invalid) return;
    const formData = new FormData();
    formData.append('claimId',  this.claimId.toString()); // pass real claimId
    formData.append('invoiceDate', this.formatDate(this.form.value.invoiceDate));
    formData.append('invoiceNumber', this.form.value.invoiceNumber);
    formData.append('billAmountBeforeTax', this.form.value.billAmountBeforeTax);
    formData.append('taxAmount', this.form.value.taxAmount);
    formData.append('totalBillAmount', this.form.value.totalBillAmount);
    formData.append('remarks', this.form.value.remarks);
    formData.append('isRejected', this.form.value.isRejected);
    formData.append('invoiceImage', this.selectedFile!);

    this.isLoading = true;
    this.apiService.raiseInvoice(formData).subscribe({
    next: res => {
      this.toast.success('Invoice raised successfully.!');
      this.dialogRef.close('success');
      this.isLoading = false;
    },
    error: err => {  this.toast.error('Something went wrong!');     
     this.isLoading = false;
    }
  });
  }

  private formatDate(date: Date): string {
  return date.toISOString().split('T')[0];
}

  close() {
    this.dialogRef.close();
  }
}
