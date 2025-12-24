import { Component, inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { CommonModule } from '@angular/common';
import { MatDialogModule } from '@angular/material/dialog';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { ApiService, ClaimCustomerVisitImages, ClaimClosedWithOrWithoutRepair,InvoiceDetail } from '../services/api.service';
import { forkJoin, of } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { ToastService } from '../services/toastService.service';
import { Claim } from '../models/claim.model';

@Component({
  selector: 'app-claim-images-dialog',
  standalone: true,
  imports: [
    CommonModule,
    MatDialogModule,
    MatButtonModule,
    MatIconModule
  ],
  templateUrl: './claim-images.html',
  styleUrls: ['./claim-images.css']
})
export class ClaimImages implements OnInit {
isLoading: boolean = false;
data!: ClaimCustomerVisitImages;
invoice!: InvoiceDetail;
repairImages!: ClaimClosedWithOrWithoutRepair;
role:string | null = null;
  constructor(
    private dialogRef: MatDialogRef<ClaimImages>,private apiService: ApiService
  ) {}

  private toast = inject(ToastService);
  private claimdata = inject(MAT_DIALOG_DATA) as {claimId:number, claim: Claim };
  claimId =  this.claimdata.claimId;
  claim = this.claimdata.claim;

  ngOnInit(): void {
    this.loadImages();
  }

  loadImages(){
    this.isLoading = true;
    this.role = localStorage.getItem("userRole")!;
    forkJoin({
  CustomerVisitImages: this.apiService
    .getCustomerVisitImages(this.claimId)
    .pipe(
      catchError(err => {
        console.error('CustomerVisitImages failed', err);
        return of(null); // or []
      })
    ),

  RepairDoneImages: this.apiService
    .GetRepairDoneImages(this.claimId)
    .pipe(
      catchError(err => {
        console.error('RepairDoneImages failed', err);
        return of(null); // or []
      })
    ),

  InvoiceDetails: this.apiService
    .GetClaimInvoiceDetail(this.claimId)
    .pipe(
      catchError(err => {
        console.error('InvoiceDetails failed', err);
        return of(null);
      })
    )
})
.subscribe({
  next: ({ CustomerVisitImages, RepairDoneImages, InvoiceDetails }) => {

    this.data = CustomerVisitImages! ?? [];
    this.repairImages = RepairDoneImages! ?? [];
    this.invoice = InvoiceDetails! ?? null;

    this.isLoading = false;
  },
  error: () => {
    // This will almost NEVER hit now
    this.isLoading = false;
  }
});
  }


  close() {
    this.dialogRef.close();
  }

  downloadAll() {
    console.log('Download bulk images');
  }

  detectMimeType(base64: string): string {
  if (!base64) return 'application/octet-stream';

  // If data URL exists, extract MIME type
  if (base64.startsWith('data:')) {
    const match = base64.match(/^data:(.*?);base64,/);
    if (match && match[1]) {
      return match[1];
    }
  }

  // Fallback detection (magic numbers)
  const firstChars = base64.substring(0, 20);

  if (firstChars.startsWith('/9j')) return 'image/jpeg';
  if (firstChars.startsWith('iVBOR')) return 'image/png';
  if (firstChars.startsWith('R0lGOD')) return 'image/gif';
  if (firstChars.startsWith('JVBERi0')) return 'application/pdf';
  if (firstChars.startsWith('AAAA') || firstChars.startsWith('AAAB')) return 'video/mp4';

  return 'application/octet-stream';
}


  openInNewTab(base64: string) {
  if (!base64) return;

  const mimeType = this.detectMimeType(base64);

  // Remove prefix if exists
  const cleanBase64 = base64.includes(',')
    ? base64.split(',')[1]
    : base64;

  const byteCharacters = atob(cleanBase64);
  const byteNumbers = new Array(byteCharacters.length);

  for (let i = 0; i < byteCharacters.length; i++) {
    byteNumbers[i] = byteCharacters.charCodeAt(i);
  }

  const byteArray = new Uint8Array(byteNumbers);
  const blob = new Blob([byteArray], { type: mimeType });

  const blobUrl = URL.createObjectURL(blob);
  window.open(blobUrl, '_blank');
}
getDataUrl(base64: string): string {
  const mime = this.detectMimeType(base64);
  return `data:${mime};base64,${base64}`;
}

updateClaimStatus(status: string, remarks: string) {
    this.isLoading = true;
    this.apiService.AcceptOrRejectClaim(this.claimId!, status, remarks).subscribe({
      next: (res) => {
        //this.claim = res.data.results[0] as Claim;
        this.toast.success(status +' Successfully!');

        this.isLoading = false; // hide spinner
         this.close();
      },
      error: (err) => {
        this.toast.error(err?.error || 'Error occured updating the claim!')
        this.isLoading = false; // hide spinner even on error
      }
    });
  }
}
