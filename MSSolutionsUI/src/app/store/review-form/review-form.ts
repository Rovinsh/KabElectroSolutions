import { Component, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatDialogModule, MatDialogRef } from '@angular/material/dialog';
import { FormGroup, FormsModule, Validators,FormBuilder,ReactiveFormsModule } from '@angular/forms';
import { ToastService } from '../../services/toastService.service';
import { ApiService } from '../../services/api.service';

@Component({
  selector: 'app-review-form',
  standalone: true,
  imports: [CommonModule, FormsModule, MatDialogModule, ReactiveFormsModule,],
  templateUrl: './review-form.html',
  styleUrls: ['./review-form.css']
})
export class ReviewFormComponent {
  isSubmitting = false;
  reviewForm!: FormGroup;
  private fb = inject(FormBuilder);
  private toast = inject(ToastService);
  private apiService = inject(ApiService);
  private dialogRef = inject(MatDialogRef<ReviewFormComponent>);

   ngOnInit(): void {
      this.reviewForm = this.fb.group({
       rating: [0, Validators.required],
      comment: ['', [Validators.required, Validators.minLength(10)]]
      });
    }
 stars = [1, 2, 3, 4, 5];
  setRating(star: number) {
    this.reviewForm.patchValue({ rating: star });
  }


    submit() {
    if (this.reviewForm.invalid) {
      this.reviewForm.markAllAsTouched();
      return;
    }
       if (this.reviewForm.invalid) {
      this.reviewForm.markAllAsTouched();
      return;
    }
    const formData = { ...this.reviewForm.value};
    this.isSubmitting = true;
      this.apiService.postReviewComment(formData).subscribe({
        next: () => {
          this.toast.success('Review Add Successfully!');
          this.dialogRef.close('success');this.isSubmitting = false;
        },
        error: (err) => {
        this.toast.error(err?.error || 'Error creating Review!');
        this.isSubmitting = false;
      }
      });
    }

  onClose() {
    this.dialogRef.close();
  }
}
