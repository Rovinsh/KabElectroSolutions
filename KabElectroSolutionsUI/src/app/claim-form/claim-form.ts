import { Component, inject, OnInit } from '@angular/core';
import { ReactiveFormsModule, FormBuilder, FormGroup, Validators, FormControl } from '@angular/forms';
import { HttpClient } from '@angular/common/http';
// Angular Material
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { MatButtonModule } from '@angular/material/button';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { MatNativeDateModule } from '@angular/material/core';
import { MatCardModule } from '@angular/material/card';
import { MatSelectModule } from '@angular/material/select';
import { CommonModule } from '@angular/common';
import { MatAutocompleteModule } from '@angular/material/autocomplete';
import { Observable, startWith, map, of, debounceTime, distinctUntilChanged, switchMap, combineLatest } from 'rxjs';
import { ApiService,WarrantyDto } from '../services/api.service';
import { MatDialog } from '@angular/material/dialog';
import { WarrantyPopupComponent } from '../warranty-popup/warranty-popup';
import { ToastService } from '../services/toastService.service';
@Component({
  selector: 'app-claim-form',
  templateUrl: './claim-form.html',
  styleUrls: ['./claim-form.css'],
  imports: [
    ReactiveFormsModule,
    MatFormFieldModule,
    MatInputModule,
    MatCheckboxModule,
    MatButtonModule,
    MatDatepickerModule,
    MatNativeDateModule,
    MatCardModule,
    MatSelectModule,
    CommonModule,
    MatAutocompleteModule
  ]
})
export class ClaimFormComponent implements OnInit {
  claimForm!: FormGroup;
  constructor(private fb: FormBuilder, private http: HttpClient, private apiService: ApiService, private dialog: MatDialog) { }
 private toast = inject(ToastService);
  ngOnInit(): void {
    this.claimForm = this.fb.group({
      technicianName: [''],
      lmStatus: [''],
      itemName: ['',Validators.required],
      rating: [null],
      l3ApprovalDate: [null],
      servicePartner: [null],
      otpRequired: [false],
      displayName: [''],
      reasons: ['',Validators.required],
      callCloseRemarks: [''],
      concern: ['',Validators.required],
      claimRegisteredPhoneNumber: [''],
      reasonOfLoss: [''],
      estimationFirst: [null],
      solvyPan: [''],
      l2ServiceRejectionRemarks: [''],
      servicePartnerName: [''],
      voiceUrl: [''],
      estimationParts: [''],
      customerAddress: ['',Validators.required],
      brandComplaintNumber: [''],
      address: [null],
      otpVerificationTimestamp: [null],
      warrantyStartDate: [null],
      channelId: [null],
      phone: [''],
      itemPrice: [null,Validators.required],
      warrantyDuration: [null],
      invoiceDate: [null],
      assignedExecutiveName: [''],
      alternateContact: [''],
      planSoldDate: [null,Validators.required],
      raiseAdditional: [false],
      warrantyTypeId: [null],
      itemSerialNumber: ['',Validators.required],
      solvyAddress: [''],
      endDate: [null],
      itemBrand: [''],
      l2ServiceApprovalDate: [null],
      claimVerificationDocumentUploadTimestamp: [null],
      customerEmail: ['',Validators.required],
      customerAlternativeEmail: [''],
      channelName: [''],
      claimRedeemStatus: [''],
      createdTime: [''],
      endStatus: [''],
      l2InsuranceRejectionRemarks: [''],
      callAbortDateTime: [null],
      servicePartnerCity: [''],
      estimationDateTime: [null],
      estimationActionDate: [null],
      repairCompletionDate: [null],
      warrantyActivationCode: ['',Validators.required],
      invoiceActionDate: [null],
      status: [null],
      itemImei: [''],
      hsnRequired: [false],
      customerPincode: ['',Validators.required],
      estimationLast: [null],
      servicePartnerPhone: [''],
      itemCategory: [''],
      technician: [''],
      startDate: [null],
      customerAlternateEmail: [''],
      servicePartnerState: [''],
      claimRedeemedDate: [null],
      l2InsuranceApprovalDate: [null],
      utrNumber: [''],
      extraInfo: [''],
      appointmentConfirmationTime: [null],
      created: [null],
      claimRedeemed: [false],
      previousVisitProductSerialNumber: [''],
      servicePartnerGST: [''],
      callAbortReason: [''],
      insuredCompany: [''],
      solvyGST: [''],
      paymentDone: [''],
      servicePartnerPincode: [null],
      claimApproved: [null],
      appointmentPendingReason: [''],
      insured: [''],
      statusName: [''],
      selfInvoice: [''],
      servicePartnerPAN: [''],
      servicePartnerAddress: [''],
      storeName: [''],
      l1ApprovalDate: [null],
      previousStatus: [null],
      firstVisitTAT: [null],
      paymentStatus: [''],
      estimationPaymentAmount: [null],
      customerPhone: ['', [Validators.required, Validators.pattern(/^[0-9]{10}$/)]],
      customerAlternativePhone: [''],
      warranty: [null],
      claimPaymentStatus: [''],
      registeredBy: [null],
      l1RejectionRemarks: [''],
      dropDate: [null],
      cta: [''],
      customerCity: ['',Validators.required],
      item: [null],
      isAddressEditable: [false],
      registeredByName: [''],
      l3RejectionRemarks: [''],
      createdDate: [null],
      claimType: [null],
      repairDoneTAT: [null],
      warrantyType: ['',Validators.required],
      pickupDate: [null],
      itemCategoryId: [null],
      paymentId: [''],
      remarks: ['',Validators.required],
      type: [''],
      claimAmount: [null],
      appointment: [null],
      solvyStateCode: [''],
      paymentTxnId: [''],
      paymentAmount: [null],
      amount: [null],
      invoiceNumber: [''],
      customerName: ['',Validators.required],
      categoryName: ['',Validators.required],
      customerState: ['',Validators.required],
      sgst: [''],
      cgst: [''],
      igst: [''],
      SLANo: ['']
    });
    
combineLatest([
  this.claimForm.get('customerPhone')!.valueChanges.pipe(
    startWith(this.claimForm.get('customerPhone')!.value || ''),
    debounceTime(500),
    distinctUntilChanged()
  ),
  this.claimForm.get('customerEmail')!.valueChanges.pipe(
    startWith(this.claimForm.get('customerEmail')!.value || ''),
    debounceTime(500),
    distinctUntilChanged()
  )
])
.pipe(
  switchMap(([phone, email]) => {
    const phoneValid = phone && phone.length === 10 && /^[0-9]+$/.test(phone);
    const emailValid = email && /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);

    if (phoneValid || emailValid) {
      return this.getWarrantyByParameter(phone || '', email || '');
    }

    return of(null);
  })
)
.subscribe((response) => {
  if (response) {
    this.openPopup(response);
  }
});
  }

getWarrantyByParameter(phone: string, email: string): Observable<WarrantyDto> {
  return this.apiService.getWarranties(phone, email).pipe(
    map((res: any) => res || null)
  );
}

  openPopup(data: WarrantyDto | WarrantyDto[]) {
    const dialogRef = this.dialog.open(WarrantyPopupComponent, {
      width: '1100px',
    maxWidth: '110vw',
    maxHeight: '90vh',
    height: 'auto',
    panelClass: 'custom-dialog-container',
    disableClose: true,
    data: { record: Array.isArray(data) ? data : [data] }
    });

    dialogRef.afterClosed().subscribe(selectedRow => {
      if (selectedRow) {
      this.claimForm.patchValue({
        //  customerPhone:selectedRow.customerMobileNo,
        //  customerEmail:selectedRow.customerEmail,
        customerName:selectedRow.customerName,
        customerState:selectedRow.customerStateName,
         customerCity:selectedRow.customerCityName,
        customerAddress:selectedRow.customerAddress,
        customerPincode:selectedRow.customerPinCode,
        itemSerialNumber:selectedRow.serialNumber,
        itemName:selectedRow.productName,
        categoryName:selectedRow.catgoryName,
        itemPrice:selectedRow.warrantyPrice,
        planSoldDate:selectedRow.warrantyPurchaseDate,
        warranty:selectedRow.serialNumber ,
        warrantyActivationCode:selectedRow.warrantyCode,
        warrantyType:selectedRow.warrantyType,
        displayName:selectedRow.displayName,
    });
    };
  });}

  onSubmit(): void {
    if (this.claimForm.valid) {
 const formData = {
      ...this.claimForm.value,
      // isDisable: this.claimForm.value.isDisable ? true : false,
      claimRegisteredPhoneNumber: this.claimForm.value.customerMobileNo,
    };
this.apiService.postClaim(formData).subscribe({
        next: () => {
          this.toast.success('Brand Created Successfully!');
        },
        error: (err) => this.toast.error(err?.error || 'Error creating Brand!')
      });
    }
  }

}
