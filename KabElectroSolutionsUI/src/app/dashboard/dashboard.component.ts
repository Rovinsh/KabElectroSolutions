import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { ApiService } from '../services/api.service';
import { Claim } from '../models/claim.model';
import { MatDialog } from '@angular/material/dialog';
import { ClaimDetailsComponent } from '../claim-details/claim-details';
import { RouterModule } from '@angular/router';


// interface Claim {
//   //id:number,
//   claimCode: string;
//   warrantySerialNo: string;
//   warrantyType: string;
//   //warrantyActivationCode:string;
//   warrantyCode: string;
//   createdBy: string;
//   planName: string;
//   customerName: string;
//   customerPhone: string;
//   cityState: string;
//   status:string;
// }

@Component({
  selector: 'app-dashboard',
  imports:[FormsModule,CommonModule, RouterModule],
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent {
  constructor(private apiService: ApiService,private dialog: MatDialog) {}
  claims: Claim[]=[];
  status : any[]= [];

  tabs = ['Assigned Claims', 'Accepted Claims', 'Verified Claims', 'Invoices', 'All Claims'];
  activeTab = this.tabs[0];

  // claims: Claim[] = [
  //   {
  //     claimCode: '547343', warrantySerialNo: '12932038', warrantyType: 'DEVICE SECURE GOLD',
  //     warrantyCode: 'URP9331392', createdBy: 'Suraj Choudhary', planName: 'DEVICE SECURE GOLD',
  //     customerName: 'PRAMILA NAGBANSHI', customerPhone: '9026492590', cityState: 'Uttar Pradesh, Gorakhpur',
  //     status: 'Appointment Taken'
  //   },
  //   {
  //     claimCode: '547341', warrantySerialNo: '14189859', warrantyType: 'DEVICE SECURE',
  //     warrantyCode: 'UNK9234021', createdBy: 'Suraj Choudhary', planName: 'DEVICE SECURE',
  //     customerName: 'Kriti Gautam', customerPhone: '9051853678', cityState: 'Haryana, Ambala',
  //     status: 'Call Aborted'
  //   },
  //   // Add more rows or connect to service
  // ];

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
}