import { Component,inject } from '@angular/core';
import { MatDialogModule } from '@angular/material/dialog';
import { MatButtonModule } from '@angular/material/button';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { FormsModule } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { ApiService} from '../services/api.service';
import { ToastService } from '../services/toastService.service';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-review-invoice',
  imports: [MatDialogModule ,MatButtonModule ,MatFormFieldModule,MatInputModule,FormsModule,CommonModule ],
  templateUrl: './review-invoice.html',
  styleUrl: './review-invoice.css'
})
export class ReviewInvoice {
  remark = '';
  error = false;
   isLoading: boolean = false;
   private toast = inject(ToastService);
   private data = inject(MAT_DIALOG_DATA) as { claimId: number };

  claimId = this.data.claimId;
  constructor(private dialogRef: MatDialogRef<ReviewInvoice>,private apiService: ApiService) {}

  accept() {
    if (!this.remark.trim()) {
      this.error = true;
      return;
    }
    this.updateClaimStatus(this.claimId,"Invoice Accepted By Finance",this.remark);
    
  }

  reject() {
    if (!this.remark.trim()) {
      this.error = true;
      return;
    }
this.updateClaimStatus(this.claimId,"Invoice Rejected By Finance",this.remark);
    // this.dialogRef.close({
    //   status: 'REJECT',
    //   remark: this.remark
    // });
  }

updateClaimStatus(claimId: number,status: string, remarks:string) {
    this.isLoading = true;
    this.apiService.AcceptOrRejectClaim(claimId, status, remarks).subscribe({
      next: (res) => {        
        this.isLoading = false; // hide spinner
         this.toast.success(status +' Successfully!');
         this.dialogRef.close({
    });
      },
      error: (err) => {
        this.toast.error(err?.error || 'Error occured updating the claim!')
        this.isLoading = false; // hide spinner even on error
      }
    });
  }


  close() {
    this.dialogRef.close();
  }
}
