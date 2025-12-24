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
import { AppointmentComponent } from '../appointment/appointment';
import { CustomerVisitComponent } from '../customer-visit/customer-visit';
import { AuthService } from '../services/auth';
import { ShareEstimationComponent } from '../share-estimation/share-estimation';
import { CloseWithOrWithoutRepairDialog } from '../close-with-or-without-repair-dialog/close-with-or-without-repair-dialog';
import { RepairDialogComponent } from '../repair/repair';

@Component({
  selector: 'app-dashboard',
  imports:[FormsModule,CommonModule, RouterModule,MatIconModule],
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent {
  constructor(private apiService: ApiService,private dialog: MatDialog,private auth: AuthService) {}
  claims: Claim[]=[];
  status : any[]= [];
  private toast = inject(ToastService);
  tabs = ['Assigned Claims', 'Accepted Claims', 'Verified Claims', 'Invoices', 'All Claims'];
  activeTab = this.tabs[0];
  isLoading: boolean = false;
  role:string | null = null;

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
  itemsPerPage = 100;
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

openAppointmentPopup(claimId: number, claim : Claim) {
  const dialogRef = this.dialog.open(AppointmentComponent, {
    width: '700px',
    maxWidth: '150vw',  
        maxHeight: '130vh',  
        height: 'auto',
        disableClose: true,
        autoFocus: false,
        data: {
          claimId: claimId,
          appointmentDate: claim.appointment,
          appointmentTime: claim.appointmentConfirmationTime,
          pendingReason : claim.appointmentPendingReason
        }
  });

  dialogRef.afterClosed().subscribe(result => {
    if (result) {
     this.isLoading = true;
    this.apiService.ScheduleAppointment(claimId, "Appointment Taken",result, "Appointment Taken").subscribe({
      next: (res:any) => {        
        this.isLoading = false; // hide spinner
         this.toast.success("Appointment Taken" +' Successfully!');
         this.selectTab(this.activeTab);
      },
      error: (err:any) => {
        this.toast.error(err?.error || 'Error occured while taking appointment!')
        this.isLoading = false; // hide spinner even on error
      }
    });
    }
  });
}

openRepairPopup(claimId: number, claim : Claim) {
  const dialogRef = this.dialog.open(RepairDialogComponent, {
    width: '600px',
    maxWidth: '100vw',   
    maxHeight: '75vh',   // 👈 reduces popup height
    height: 'auto',
        disableClose: true,
        autoFocus: false,
        data: {
          claimId: claimId
        }
  });

  dialogRef.afterClosed().subscribe(result => {
    if (result) {
      this.selectTab(this.activeTab);    
    }
  });
}

openWithOrWithoutRepairPopup(claimId: number, claim : Claim,CloseWithOrWithoutRepair: string) {
  const dialogRef = this.dialog.open(CloseWithOrWithoutRepairDialog, {
    width: '350px',
    maxWidth: '100vw',   
    maxHeight: '75vh',   // 👈 reduces popup height
    height: 'auto',
        disableClose: true,
        autoFocus: false,
        data: {
          claimId: claimId,
          closeWithOrWithoutRepair: CloseWithOrWithoutRepair
        }
  });

  dialogRef.afterClosed().subscribe(result => {
    if (result) {
      this.selectTab(this.activeTab);    
    }
  });
}

openShareEstimationPopup(claimId: number, claim : Claim) {
  const dialogRef = this.dialog.open(ShareEstimationComponent, {
    width: '1200px',
    maxWidth: '300vw',   
        height: '300vw',
        disableClose: true,
        autoFocus: false,
        data: {
          claimId: claimId
        }
  });

  dialogRef.afterClosed().subscribe(result => {
    if (result) {
      this.selectTab(this.activeTab);
    //  this.isLoading = true;
    // this.apiService.ShareEstimation(claimId, "Estimation Shared",result, "Estimation Shared").subscribe({
    //   next: (res:any) => {        
    //     this.isLoading = false; // hide spinner
    //      this.toast.success("Estimation Shared" +' Successfully!');
    //      this.selectTab(this.activeTab);
    //   },
    //   error: (err:any) => {
    //     this.toast.error(err?.error || 'Error occured while  Sharing estimation!')
    //     this.isLoading = false; // hide spinner even on error
    //   }
    // });
    }
  });
}


openVisitPopup(claimId: number, claim : Claim) {
  const dialogRef = this.dialog.open(CustomerVisitComponent, {   
    maxWidth: '100%',
    maxHeight: '90vh',
    panelClass: 'no-scroll-dialog',
    disableClose: true,
    autoFocus: false,
        data: {
          claimId: claimId,
          appointmentDate: claim.appointment,
          appointmentTime: claim.appointmentConfirmationTime,
          pendingReason : claim.appointmentPendingReason
        }
  });

  dialogRef.afterClosed().subscribe(result => {
    if (result) {
       this.selectTab(this.activeTab);
    //  this.isLoading = true;
    // this.apiService.ScheduleAppointment(claimId, "Appointment Taken",result, "Appointment Taken").subscribe({
    //   next: (res:any) => {        
    //     this.isLoading = false; // hide spinner
    //      this.toast.success("Appointment Taken" +' Successfully!');
    //      this.selectTab(this.activeTab);
    //   },
    //   error: (err:any) => {
    //     this.toast.error(err?.error || 'Error occured while taking appointment!')
    //     this.isLoading = false; // hide spinner even on error
    //   }
    // });
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

  selectTab(tab: string) {
    this.activeTab = tab;
    let subStatusId:number = 0;

    if(tab == 'Assigned Claims')
      subStatusId= this.getSubStatusId("Service Centre Assigned");
    if(tab == "Accepted Claims")
      subStatusId= this.getSubStatusId("Call Accepted By Service Center");
    if(tab == "Verified Claims")
      subStatusId= this.getSubStatusId("Claim Verified");    
    if(tab == 'Invoices')
      subStatusId= this.getSubStatusId("Repair Completed");
     this.loadClaimsByStatus(subStatusId);     
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
    this.role = this.auth.userRole;
    this.apiService.getStatus('Status/status').subscribe({
      next: (status) => {
        this.status = Object.values(status.data);
        
    this.loadClaimsByStatus(this.getSubStatusId("Service Centre Assigned"));
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
  this.isLoading = true;
  this.apiService.getClaims(`Claims/claims?statusId=${subStatusId}`).subscribe({
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


updateClaimStatus(claimId: number,status: string, remarks:string) {
    this.isLoading = true;
    this.apiService.AcceptOrRejectClaim(claimId, status, remarks).subscribe({
      next: (res) => {        
        this.isLoading = false; // hide spinner
         this.toast.success(status +' Successfully!');
         this.selectTab(this.activeTab);
      },
      error: (err) => {
        this.toast.error(err?.error || 'Error occured updating the claim!')
        this.isLoading = false; // hide spinner even on error
      }
    });
  }

}