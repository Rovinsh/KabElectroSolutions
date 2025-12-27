import { Component,Input } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Claim } from '../models/claim.model';
import { ApiService } from '../services/api.service';

@Component({
  selector: 'app-claim-history',
  imports: [CommonModule],
  templateUrl: './claim-history.html',
  styleUrl: './claim-history.css'
})
export class ClaimHistory {
  constructor(private apiService: ApiService){}
//@Input() timelines: any[] = [];
@Input() claimId!: string;
@Input() phoneNumber!: string;
@Input() statusList: any[]= [];
 claims: Claim[]=[];
 isLoading: boolean = false;
  steps = [
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
  timelines = [
  {
    date: 'Dec 23, 2025',
    serviceCenter: 'KAB ELECTRO SOLUTIONS',
    completedStep: 5 // Up to "Repair"
  },
  {
    date: 'Dec 20, 2025',
    serviceCenter: 'KAB ELECTRO SOLUTIONS',
    completedStep: 5 // Up to "Repair"
  },
  {
    date: 'Dec 15, 2025',
    serviceCenter: 'KAB ELECTRO SOLUTIONS',
    completedStep: 3 // Up to "Customer Visit"
  }
];

 ngOnInit(): void {
  this.loadClaimsByPhoneNumber(this.phoneNumber);
 }


//this.claims = res.data.results as Claim[];

  isCompleted(stepIndex: number, completedStep: number): boolean {

    let statusName = this.getParentStatusName(completedStep);
    const currentIndex = this.steps.indexOf(statusName);
    return stepIndex <= currentIndex;
  }

getParentStatusName(subStatusId: number)
{ 
const parentStatus = Object.values(this.statusList).find(
  (status: any) =>
    status.substatus?.some(
      (s: any) => s.substatusid === subStatusId
    )
);

  return parentStatus ? parentStatus.name : null;
}

  loadClaimsByPhoneNumber(phoneNumber: string): void {
    this.isLoading = true;
    this.apiService.getClaimsByPhoneNumber(phoneNumber).subscribe({
      next: (res) => {
        this.claims = res.data.results as Claim[];
        this.isLoading = false;
        console.log('API response:', res);
      },
      error: (err) => {
        this.isLoading = false;
        console.error('API error:', err);
      }
    });
  }
}
