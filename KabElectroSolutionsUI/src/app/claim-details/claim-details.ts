import { Component, OnInit, inject  } from '@angular/core';
import { ActivatedRoute,Router  } from '@angular/router';
import { Claim } from '../models/claim.model';
import { ApiService } from '../services/api.service';
import { CommonModule, DatePipe } from '@angular/common';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MatDialogModule } from '@angular/material/dialog';
import { MatIconModule } from '@angular/material/icon';
import { MatButtonModule } from '@angular/material/button';
import { AuditLogComponent } from '../audit-log/audit-log';
import { ToastService } from '../services/toastService.service';

@Component({
  selector: 'app-claim-details',
  templateUrl: './claim-details.html',
  styleUrls: ['./claim-details.css'],
  imports: [CommonModule, MatDialogModule, MatButtonModule,MatIconModule,AuditLogComponent],
  providers: [DatePipe]
})
export class ClaimDetailsComponent implements OnInit {
claimId: string | null = null;
claim: Claim | null = null;
isLoading: boolean = false;
selectedTab: string = 'details';
auditData = [];
// auditData = [
//   {
//     status: 'Call Registered',
//     performerName: 'Croma claim',
//     designation: 'Call Center Executive',
//     timestamp: '2025-11-01 18:09:53',
//     remarks: 'service request'
//   },
//   {
//     status: 'AssignServicePartner',
//     performerName: 'Partha Ghosh Chowdhury',
//     designation: 'Service Executive',
//     timestamp: '2025-11-01 18:54:17',
//     remarks: '-'
//   }
// ];

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

  constructor(private route: ActivatedRoute,private apiService: ApiService,private router: Router) {}

  ngOnInit(): void {

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
    this.apiService.getStatus('Status/status').subscribe({
      next: (status) => {
        this.status = status.data;
        const currentStatus = this.status[this.claim!.status].name || 'Claim Registered';
        this.currentStepIndex = statusToStepMap[currentStatus] ?? 0;
      },
      error: (err) => {
        console.error('API error:', err);
      }
    });
    //this.claimId = this.data.claimId;    

    console.log('Claim ID:', this.claimId);
    
    this.isLoading = true; // show spinner
        this.apiService.getClaims('Claims/claim?claimId='+this.claimId).subscribe({
          next: (res) => {
            this.claim = res.data.results[0] as Claim;
            console.log('API response:', res);
            this.isLoading = false; // hide spinner
          },
          error: (err) => {
            console.error('API error:', err);
            this.isLoading = false; // hide spinner even on error
          }
        });
      } 
      close(): void {
    this.router.navigate(['/dashboard']); // 👈 back to list page
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
