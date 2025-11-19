import { Component, inject } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialogModule } from '@angular/material/dialog';
import { MatButtonModule } from '@angular/material/button';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatSelectModule } from '@angular/material/select';
import { FormsModule } from '@angular/forms';
import { ApiService } from '../services/api.service';
import { ToastService } from '../services/toastService.service';

@Component({
  selector: 'app-verify-dialog',
  imports: [MatDialogModule,
    MatDialogModule,
    MatButtonModule,
    MatFormFieldModule,
    MatSelectModule,
    FormsModule],
  templateUrl: './verify-dialog.html',
  styleUrl: './verify-dialog.css'
})
export class VerifyDialog {
selectedReason: string = '';
 constructor(private apiService: ApiService) {}
 private toast = inject(ToastService);
 private data = inject(MAT_DIALOG_DATA) as {claimId:number };
 claimId =  this.data.claimId;
updateClaimStatus(claimId: number,status: string, remarks:string) {
    //this.isLoading = true;
    this.apiService.AcceptOrRejectClaim(claimId, status, remarks).subscribe({
      next: (res) => {        
        //this.isLoading = false; // hide spinner
         this.toast.success(status +' Successfully!');
         //this.selectTab(this.activeTab);
      },
      error: (err) => {
        this.toast.error(err?.error || 'Error occured updating the claim!')
        //this.isLoading = false; // hide spinner even on error
      }
    });
  }
}
