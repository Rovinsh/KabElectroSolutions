import { Component, inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialogModule, MatDialogRef } from '@angular/material/dialog';
import { MatButtonModule } from '@angular/material/button';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatAutocompleteModule } from '@angular/material/autocomplete';
import { MatOptionModule } from '@angular/material/core';
import { MatInputModule } from '@angular/material/input';
import { FormsModule, ReactiveFormsModule, FormControl } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { MatIconModule } from '@angular/material/icon';

import { ApiService, ServicePartnerDto } from '../services/api.service';
import { ToastService } from '../services/toastService.service';

@Component({
  selector: 'app-assign-partner',
  imports: [
    MatDialogModule,
    MatButtonModule,
    MatFormFieldModule,
    MatInputModule,
    MatAutocompleteModule,
    MatOptionModule,
    ReactiveFormsModule,
    CommonModule,
    MatIconModule,
    FormsModule
  ],
  templateUrl: './assign-partner.html',
  styleUrl: './assign-partner.css'
})
export class AssignPartner implements OnInit {

  partnerCtrl = new FormControl('');
  selectedPartner: ServicePartnerDto | null = null;

  private toast = inject(ToastService);
  private data = inject(MAT_DIALOG_DATA) as { claimId: number };

  claimId = this.data.claimId;

  servicePartner: ServicePartnerDto[] = [];
  filteredPartners: ServicePartnerDto[] = [];

  constructor(
    private apiService: ApiService,
    private dialogRef: MatDialogRef<AssignPartner>
  ) {}

  ngOnInit(): void {
    this.loadServicePartners();

    // live filtering on typing
    this.partnerCtrl.valueChanges.subscribe(value => {
      this.applyFilter(value || '');
    });
  }

  applyFilter(value: string) {
    const filterValue = value.toLowerCase();

    this.filteredPartners = this.servicePartner.filter(x =>
      x.servicePartner?.toLowerCase().includes(filterValue)
    );
  }

  onPartnerSelected(event: any) {
    const selectedName = event.option.value;
    this.selectedPartner = this.servicePartner.find(p => p.servicePartner === selectedName) || null;
  }

  loadServicePartners() {
    this.apiService.getServicePartners().subscribe(res => {
      this.servicePartner = res.data.sort((a: any, b: any) =>
        a.servicePartner.localeCompare(b.servicePartner)
      );

      // initialize filtered partners
      this.filteredPartners = [...this.servicePartner];
    });
  }

  AssignPartner(claimId: number, status: string,  remarks: string) {
    if (!this.selectedPartner || this.selectedPartner.id == null) {
      this.toast.error("Please select a partner");
      return;
    }
    this.apiService.AssignPartner(claimId, status,this.selectedPartner?.id, remarks).subscribe({
      next: () => {
        this.toast.success(status + ' Successfully!');
         this.dialogRef.close("Partner Assigned");
      },
      error: (err) => {
        this.toast.error(err?.error || 'Error occurred updating the claim!');
      }
    });
  }

  onClose() {
    this.dialogRef.close();
  }
}
