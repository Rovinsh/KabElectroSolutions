import { Component, OnInit, inject  } from '@angular/core';
import { ActivatedRoute,Router  } from '@angular/router';
import { Claim } from '../models/claim.model';
import { ApiService, Note } from '../services/api.service';
import { CommonModule, DatePipe } from '@angular/common';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MatDialogModule } from '@angular/material/dialog';
import { MatIconModule } from '@angular/material/icon';
import { MatButtonModule } from '@angular/material/button';
import { AuditLogComponent } from '../audit-log/audit-log';
import { ToastService } from '../services/toastService.service';
import { FormsModule } from '@angular/forms';
import { AuthService } from '../services/auth';
import { forkJoin } from 'rxjs';
import { ClaimImages } from '../claim-images/claim-images';
import { MatDialog } from '@angular/material/dialog';
import {EstimationDetails} from '../estimation-details/estimation-details'
import {ClaimHistory} from '../claim-history/claim-history'

@Component({
  selector: 'app-claim-details',
  templateUrl: './claim-details.html',
  styleUrls: ['./claim-details.css'],
  imports: [CommonModule, MatDialogModule, MatButtonModule,MatIconModule,AuditLogComponent,FormsModule,EstimationDetails,ClaimHistory ],
  providers: [DatePipe]
})
export class ClaimDetailsComponent implements OnInit {
claimId: string | null = null;
claim: Claim | null = null;
isLoading: boolean = true;
selectedTab: string = 'details';
auditData = [];
showNotes = false;
newNote = '';
claimNotes: Note[] = [];
role:string | null = null;

steps: string[] = [
  'Claim Registered',
  'Claim Allocated',
  'Customer Appointment',
  'Customer Visit',
  'Cost Estimation',
  'Repair',
  'Invoice',
  'Payment',
  'Call Closed',
  'Call Aborted'
];

currentStep: number = 1; // index of the current completed step (0-based)
currentStepIndex = 0;
status : any[]= [];
private toast = inject(ToastService);

  constructor(private route: ActivatedRoute,private apiService: ApiService,private router: Router,private auth: AuthService,private dialog: MatDialog) {}

  ngOnInit(): void {

    this.role = localStorage.getItem("userRole")!;
    const statusToStepMap: Record<string, number> = {
    'Claim Registered': 0,
    'Claim Allocated': 1,
    'Customer Appointment': 2,
    'Customer Visit': 3,
    'Cost Estimation': 4,
    'Repair': 5,
    'Invoice': 6,
    'Payment': 7,
    'Call Closed': 8,
    'Call Aborted': 9
  };

    this.claimId = this.route.snapshot.paramMap.get('claimId');
    this.isLoading = true;

forkJoin({
  statusRes: this.apiService.getStatus('Status/status'),
  claimRes: this.apiService.getClaims('Claims/claim?claimId=' + this.claimId)
}).subscribe({
  next: ({ statusRes, claimRes }) => {

    // Assign data
    this.status = statusRes.data;
    this.claim = claimRes.data.results[0] as Claim;

    // Safely calculate current status name
    const currentStatus =
      Object.values(this.status)
        .find((v: any) =>
          v.substatus?.some((s: any) => s.substatusid === this.claim?.status)
        )?.name ?? 'Claim Registered';

    // Map to step index
    this.currentStepIndex = statusToStepMap[currentStatus] ?? 0;

    this.isLoading = false;
  },
  error: (err) => {
    console.error('API error:', err);
    this.isLoading = false;
  }
});
    //this.claimId = this.data.claimId;    

    console.log('Claim ID:', this.claimId);   
    
      } 
      close(): void {
    this.router.navigate(['/dashboard']); // 👈 back to list page
  }

downloadPdf() {
  const link = document.createElement('a');
  link.href = 'assets/JobSheet.pdf';
  link.download = 'JobSheet.pdf';
  link.click();
}

  OpenClaimImagesPopup(claimId: any) {
    const dialogRef = this.dialog.open(ClaimImages, {
     width: '90vw',
    maxWidth: '800px',
    maxHeight: '90vh',
          disableClose: true,
          autoFocus: false,
          data: {
            claimId: claimId,
            claim: this.claim
          }
    });
  
    dialogRef.afterClosed().subscribe(result => {
      if (result) { 
      }
    });
  }

  updateClaimStatus(status: string, remarks: string) {
    this.isLoading = true;
    this.apiService.AcceptOrRejectClaim(parseInt(this.claimId!), status, remarks).subscribe({
      next: (res) => {
        this.claim = res.data.results[0] as Claim;
        this.toast.success(status +' Successfully!');
        this.isLoading = false; // hide spinner
      },
      error: (err) => {
        this.toast.error(err?.error || 'Error occured updating the claim!')
        this.isLoading = false; // hide spinner even on error
      }
    });
  }

  sendNote() {
  if (!this.newNote.trim()) return;

  const note:Note = {
    claimId: parseInt(this.claimId!),
    message: this.newNote,
    userName: this.auth.firstName + " " + this.auth.lastName, // from your auth
    role: this.auth.userRole,
    timeStamp: new Date().toISOString()
  };

  this.claimNotes.push(note);
  this.newNote = '';

    this.apiService.postNote(note).subscribe({
      next: (res) => { },
      error: (err) => this.toast.error(err?.error || 'Error occured while sending notes!')
    });  
  }

  toggleNotes() {
  this.showNotes = !this.showNotes;
  if(this.showNotes)
  {
    this.loadNotes();
  }
}

loadNotes() {
  this.apiService.getNotesByClaimId(parseInt(this.claimId!)).subscribe({
    next: (res) => {
      this.claimNotes = res;
    }
  });
}

  tabClicked(tab: string) {
    this.selectedTab = tab;
    if(tab === 'logs')
    {
      this.apiService.getAuditLogs('AuditLogs/Claim/'+this.claimId).subscribe({
          next: (res) => {
            this.auditData = res;
            console.log('API response:', res);            
          },
          error: (err) => {
            console.error('API error:', err);
             // hide spinner even on error
          }
        });
    }
  }      
}
