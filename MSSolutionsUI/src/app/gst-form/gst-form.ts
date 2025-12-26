import { Component, OnInit, inject } from '@angular/core';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { ApiService, GstDto } from '../services/api.service';
import { ToastService } from '../services/toastService.service';

@Component({
  selector: 'app-gst-form-component',
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
  templateUrl: './gst-form.html',
  styleUrls: ['./gst-form.css']
})
export class GstFormComponent implements OnInit {
  isSubmitting = false;
  gstForm!: FormGroup;
  title: string = 'Create GST';
  submitBtnLabel: string = 'Submit GST';
  mode: 'add' | 'edit' = 'add';

  private fb = inject(FormBuilder);
  private apiService = inject(ApiService);
  private toast = inject(ToastService);
  private dialogRef = inject(MatDialogRef<GstFormComponent>);
  private data = inject(MAT_DIALOG_DATA) as { mode: 'add' | 'edit'; record?: GstDto };

  ngOnInit(): void {
    this.gstForm = this.fb.group({
      gstValue: ['', Validators.required],
      description: [null],
      isDisable: [true]
    });

    if (this.data) {
      this.mode = this.data.mode;
      this.title = this.mode === 'edit' ? 'Edit GST' : 'Create GST';
      this.submitBtnLabel = this.mode === 'edit' ? 'Update GST' : 'Submit GST';

      if (this.mode === 'edit' && this.data.record) {
        this.gstForm.patchValue({
          gstValue: this.data.record.gstValue,
          description: this.data.record.description,
          isDisable: !!this.data.record.isDisable
        });
      }
    }
  }

  onSubmit(): void {
    if (this.gstForm.invalid) return;

    const formData = { ...this.gstForm.value, isDisable: this.gstForm.value.isDisable ? true : false };
    this.isSubmitting = true;
    if (this.mode === 'edit' && this.data.record) {
      this.apiService.updateGst(this.data.record.id, formData).subscribe({
        next: () => {
          this.toast.success('GST Updated Successfully!');
          this.dialogRef.close('success');
          this.isSubmitting = false;
        },
         error: (err) => {
        this.toast.error(err?.error || 'Error update GST!');
        this.isSubmitting = false;
      }
      });
    } else {
      this.apiService.postGst(formData).subscribe({
        next: () => {
          this.toast.success('GST Created Successfully!');
          this.dialogRef.close('success');this.isSubmitting = false;
        },
        error: (err) => {
        this.toast.error(err?.error || 'Error creating GST!');
        this.isSubmitting = false;
      }
      });
    }
  }

  onClose() {
    this.dialogRef.close();
  }
}
