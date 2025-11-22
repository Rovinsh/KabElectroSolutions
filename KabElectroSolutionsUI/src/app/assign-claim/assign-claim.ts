import { Component,inject } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { ApiService } from '../services/api.service';
import { Claim } from '../models/claim.model';
import { MatDialog } from '@angular/material/dialog';
import { ClaimDetailsComponent } from '../claim-details/claim-details';
import { RouterModule } from '@angular/router';
import { MatIconModule } from '@angular/material/icon'
import { ToastService } from '../services/toastService.service';
import { VerifyDialog } from '../verify-dialog/verify-dialog';

@Component({
  selector: 'app-assign-claim',
  imports: [FormsModule,CommonModule, RouterModule,MatIconModule],
  templateUrl: './assign-claim.html',
  styleUrl: './assign-claim.css'
})
export class AssignClaim {

  constructor(private apiService: ApiService,private dialog: MatDialog) {}
  claims: Claim[]=[];
  status : any[]= [];
  private toast = inject(ToastService);

filter = {
    warrantyType: '',
    customerName: '',
    customerPhone: '',
    claimCode:'',
    id:'',
    warrantySerialNo:'',
    status:''
  };

  currentPage = 1;
  itemsPerPage = 5;
  sortColumn: keyof Claim | null = null;
  sortAsc = true;

  get uniqueWarrantyTypes(): string[] {
    return Array.from(new Set(this.claims.map(c => c.warrantyType)));
  }

  get filteredClaims(): Claim[] {
    return this.claims.filter(c =>
      (!this.filter.warrantyType || c.warrantyType === this.filter.warrantyType) &&
      (!this.filter.customerName || c.customerName.toLowerCase().includes(this.filter.customerName.toLowerCase())) &&
      (!this.filter.customerPhone || c.customerPhone.includes(this.filter.customerPhone)) &&
      (!this.filter.id || c.id.toString().includes(this.filter.id)) //&&
      // (!this.filter.warrantySerialNo || c.warrantySerialNo.includes(this.filter.warrantySerialNo)) &&
      // (!this.filter.status || c.status.includes(this.filter.status))
    );
  }

  openVerifyModal(claimId: number) {
  const dialogRef = this.dialog.open(VerifyDialog, {
    width: '350px',
    maxWidth: '95vw',  
        maxHeight: '90vh',  
        height: 'auto',
        disableClose: true,
        data: {
          claimId: claimId
        }
  });

  dialogRef.afterClosed().subscribe(result => {
    if (result) {
      // user clicked YES
      //this.verifyClaim();
    }
  });
}

  get sortedClaims(): Claim[] {
    if (!this.sortColumn) return this.filteredClaims;
  
    const column = this.sortColumn;
  
    return [...this.filteredClaims].sort((a, b) => {
      const valA = a[column];
      const valB = b[column];
      if (valA == null && valB == null) return 0;
      if (valA == null) return this.sortAsc ? 1 : -1;
      if (valB == null) return this.sortAsc ? -1 : 1;
      if (valA < valB) return this.sortAsc ? -1 : 1;
      if (valA > valB) return this.sortAsc ? 1 : -1;
      return 0;
    });
  }

  get pagedClaims(): Claim[] {
    const start = (this.currentPage - 1) * this.itemsPerPage;
    return this.sortedClaims.slice(start, start + this.itemsPerPage);
  }

  get totalPages(): number {
    return Math.ceil(this.sortedClaims.length / this.itemsPerPage);
  }

  sortData(column: keyof Claim) {
    if (this.sortColumn === column) {
      this.sortAsc = !this.sortAsc;
    } else {
      this.sortColumn = column;
      this.sortAsc = true;
    }
  }

  getSortIcon(column: string): string {
    if (this.sortColumn !== column) return '';
    return this.sortAsc ? 'arrow-up' : 'arrow-down';
  }

  previousPage() {
    if (this.currentPage > 1) this.currentPage--;
  }

  nextPage() {
    if (this.currentPage < this.totalPages) this.currentPage++;
  }

  resetFilters() {
    this.filter = {
      warrantyType: '',
      customerName: '',
      customerPhone: '',
      claimCode:'',
      warrantySerialNo:'',
      status:'',
      id:''
    };
    this.currentPage = 1;
  }

openClaimDetails(claimId: number): void {
    this.dialog.open(ClaimDetailsComponent, {
      width: '80%',
      data: { claimId: claimId }
    });
  }

  ngOnInit(): void {
    this.apiService.getStatus('Status/status').subscribe({
      next: (status) => {
        this.status = Object.values(status.data);
        
    this.loadClaimsByStatus(this.getSubStatusId("Call Initiated"));
  },
      error: (err) => {
        console.error('API error:', err);
      }
  });
}

getSubStatusId(subStatusName: string): number{
  let subStatus = this.status.flatMap(status => status.substatus).find(sub => sub.name === subStatusName);
  return subStatus.substatusid;
}

loadClaimsByStatus(subStatusId: number): void {
  this.apiService.getClaims(`Claims/claims?statusId=${subStatusId}`).subscribe({
    next: (res) => {
      this.claims = res.data.results as Claim[];
      console.log('API response:', res);
    },
    error: (err) => {
      console.error('API error:', err);
    }
  });
}


updateClaimStatus(claimId: number,status: string, remarks:string) {
    //this.isLoading = true;
    this.apiService.AcceptOrRejectClaim(claimId, status, remarks).subscribe({
      next: (res) => {        
        //this.isLoading = false; // hide spinner
         this.toast.success(status +' Successfully!');
        // this.selectTab(this.activeTab);
      },
      error: (err) => {
        this.toast.error(err?.error || 'Error occured updating the claim!')
        //this.isLoading = false; // hide spinner even on error
      }
    });
  }
}
