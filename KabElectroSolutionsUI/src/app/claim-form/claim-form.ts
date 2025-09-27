import { Component, OnInit } from '@angular/core';
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
import { Observable, startWith, map, of } from 'rxjs';
import { ApiService, CitiesDto, LocationResponseDto, PincodeDto, StateDto,CategoryDto, BrandDto, WarrantyTypeDto } from '../services/api.service';

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
  selectedStateId: number | null = null;
  selectedCityId: number | null = null;

  // filtered observables
  filteredStates$!: Observable<StateDto[]>;
  filteredCities$!: Observable<CitiesDto[]>;
  filteredPincodes$!: Observable<PincodeDto[]>;
  filteredWarrantyTypes$!: Observable<WarrantyTypeDto[]>;
  customerState = new FormControl('');
  locations: LocationResponseDto['data'] = {};
  stateIds: string[] = [];
  cityIds: string[] = [];
  pincodes: PincodeDto[] = [];
  states: StateDto[] = [];
  cities: CitiesDto[] = [];
  products: string[]=[];
  categories: CategoryDto[]=[];
  brands: BrandDto[]=[];
  warrantyTypes:WarrantyTypeDto[]=[];

  constructor(private fb: FormBuilder, private http: HttpClient, private apiService: ApiService) { }

  ngOnInit(): void {
    this.products= ["DEVICE SECURE - GOLD","DEVICE SECURE - GOLD 1", "DEVICE SECURE - GOLD 2"];
    this.categories= [{id:1, name:"Air Conditioner"},{id:2, name:"Washing Machine"},{id:3, name:"Refrigerator"}]
    this.brands= [{id:1, name:"LG",categoryId:1},{id:2, name:"Samsung",categoryId:1},{id:3, name:"Whirlpool",categoryId:1},{id:4, name:"Samsung",categoryId:2},{id:5, name:"LG",categoryId:2},{id:6, name:"LG",categoryId:3}];

    this.apiService.getLocations().subscribe(res => {
      this.locations = res.data;
      this.stateIds = Object.keys(this.locations);
    });

    this.apiService.getStates().subscribe(res => {
      this.states = res.data;
    });

    this.apiService.getCities().subscribe(res => {
      this.cities = res.data;
    });

    this.apiService.getPincodes().subscribe(res => {
      this.pincodes = res.data;
    });

    this.apiService.getWarrantyTypes().subscribe(res => {
      this.warrantyTypes = res.data;
    });


    this.claimForm = this.fb.group({
      technicianName: [''],
      lmStatus: [''],
      itemName: [''],
      rating: [null],
      l3ApprovalDate: [null],
      servicePartner: [null],
      otpRequired: [false],
      displayName: [''],
      reasons: [''],
      callCloseRemarks: [''],
      concern: [''],
      claimRegisteredPhoneNumber: [''],
      reasonOfLoss: [''],
      estimationFirst: [null],
      solvyPan: [''],
      l2ServiceRejectionRemarks: [''],
      servicePartnerName: [''],
      voiceUrl: [''],
      estimationParts: [''],
      customerAddress: [''],
      brandComplaintNumber: [''],
      address: [null],
      otpVerificationTimestamp: [null],
      warrantyStartDate: [null],
      channelId: [null],
      phone: [''],
      itemPrice: [null],
      warrantyDuration: [null],
      invoiceDate: [null],
      assignedExecutiveName: [''],
      alternateContact: [''],
      planSoldDate: [null],
      raiseAdditional: [false],
      warrantyTypeId: [null],
      customerState: [''],
      itemSerialNumber: [''],
      solvyAddress: [''],
      endDate: [null],
      itemBrand: [''],
      l2ServiceApprovalDate: [null],
      claimVerificationDocumentUploadTimestamp: [null],
      customerEmail: [''],
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
      warrantyActivationCode: [''],
      invoiceActionDate: [null],
      status: [null],
      itemImei: [''],
      hsnRequired: [false],
      customerPincode: [''],
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
      customerPhone: [''],
      customerAlternativePhone: [''],
      warranty: [null],
      claimPaymentStatus: [''],
      registeredBy: [null],
      l1RejectionRemarks: [''],
      dropDate: [null],
      cta: [''],
      customerCity: [''],
      item: [null],
      isAddressEditable: [false],
      registeredByName: [''],
      l3RejectionRemarks: [''],
      createdDate: [null],
      claimType: [null],
      repairDoneTAT: [null],
      warrantyType: [''],
      pickupDate: [null],
      itemCategoryId: [null],
      paymentId: [''],
      remarks: [''],
      type: [''],
      claimAmount: [null],
      appointment: [null],
      solvyStateCode: [''],
      paymentTxnId: [''],
      paymentAmount: [null],
      amount: [null],
      invoiceNumber: [''],
      customerName: [''],
      sgst: [''],
      cgst: [''],
      igst: [''],
      SLANo: ['']
    });

    // this.claimForm.get('customerState')!.valueChanges.subscribe(stateId => {
    //   this.cityIds = stateId && this.locations[this.selectedStateId!]
    //     ? Object.keys(this.locations[stateId].cities)
    //     : [];
    //   this.claimForm.patchValue({ customerCity: '', customerPincode: '' });
    // });

    this.claimForm.get('customerCity')!.valueChanges.subscribe(cityId => {
      const stateId = this.selectedStateId;
      // this.pincodes = (stateId && cityId)
      //   ? this.locations[stateId].cities[cityId].pincodes
      //   : [];
      // this.claimForm.patchValue({ customerPincode: '' });
    });

    this.filteredWarrantyTypes$ = this.claimForm.get('warrantyType')!.valueChanges.pipe(
      startWith(''),
      map(value => this._filterWarrantyTypes(value || ''))
    );


    this.filteredStates$ = this.claimForm.get('customerState')!.valueChanges.pipe(
      startWith(''),
      map(value => this._filterStates(value || ''))
    );

    this.filteredCities$ = this.claimForm.get('customerCity')!.valueChanges.pipe(
      startWith(''),
      map(value => this._filterCities(value || '', this.cities))
    );

    this.filteredPincodes$ = this.claimForm.get('customerPincode')!.valueChanges.pipe(
      startWith(''),
      map(value => this._filterPincodes(value || '', this.pincodes))
    );
  }

  showAllStates(): void {
    this.claimForm.get('customerState')!.setValue('');
  }

  private _filterStates(value: string): StateDto[] {
    const filterValue = value.toLowerCase();
    return this.states.filter(state =>
      state.name.toLowerCase().includes(filterValue)
    );
  }

  showAllWarrantyTypes() {
  // Trigger valueChanges with an empty string so all warranty types are returned
  this.filteredWarrantyTypes$ = of(this.warrantyTypes);
}

   private _filterWarrantyTypes(value: string): WarrantyTypeDto[] {
    const filterValue = value.toLowerCase();
    return this.warrantyTypes.filter(warrantyType =>
      warrantyType.name.toLowerCase().includes(filterValue)
    );
  }

  // private _filter(value: string): string[] {
  //   const filterValue = value.toLowerCase();
  //   return this.states.filter(state =>
  //     state.toLowerCase().includes(filterValue)
  //   );
  // }

  private _filterCities(value: string, sourceCities: CitiesDto[]): CitiesDto[] {
    if (!this.selectedStateId) return [];
    const filterValue = value.toLowerCase();
    return sourceCities.filter(city =>
      city.name.toLowerCase().includes(filterValue)
    );
  }

  private _filterPincodes(value: string | number, cityPincodes: PincodeDto[]): PincodeDto[] {
    if (!this.selectedCityId) return [];
    const filterValue = value.toString();
    return cityPincodes.filter(p => p.pincode.toString().includes(filterValue));
  }

  onSubmit(): void {
    if (this.claimForm.valid) {
      this.http.post('/api/Claims', this.claimForm.value).subscribe({
        next: (res) => console.log('Claim created:', res),
        error: (err) => console.error('Error creating claim:', err)
      });
    }
  }

  // Event handlers for selection
  onStateSelected(stateId: number) {
    this.selectedStateId = stateId;
    const stateCities = this.cities.filter(c => c.stateId === stateId);
    this.filteredCities$ = this.claimForm.get('customerCity')!.valueChanges.pipe(
      startWith(''),
      map(value => this._filterCities(value || '', stateCities))
    );  
    this.claimForm.patchValue({ customerCity: null });
  }

  onCitySelected(cityId: number) {
    this.selectedCityId = cityId;
    const cityPincodes = this.pincodes.filter(c => c.cityId === cityId);    

    this.filteredPincodes$ = this.claimForm.get('customerPincode')!.valueChanges.pipe(
      startWith(''),
      map(value => this._filterPincodes(value || '',cityPincodes))
    );
    this.claimForm.patchValue({ customerPincode: '' });
  }
}
