import { Component, inject, OnInit } from '@angular/core';
import { ReactiveFormsModule, FormBuilder, FormGroup, Validators, FormControl } from '@angular/forms';
import { HttpClient } from '@angular/common/http';
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
import { Observable, startWith, map, of,forkJoin } from 'rxjs';
import { ApiService,BrandDto,CategoryDto,CitiesDto,PincodeDto,PlanDto,StateDto, WarrantyTypeDto } from '../services/api.service';
import { MatDialog } from '@angular/material/dialog';
import { ToastService } from '../services/toastService.service';
import { MatIconModule } from '@angular/material/icon';

@Component({
  selector: 'app-direct-claim-form',
  templateUrl: './direct-claim-form.html',
  styleUrls: ['./direct-claim-form.css'],
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
    MatAutocompleteModule,
    MatIconModule
  ]
})
export class DirectClaimFormComponent implements OnInit {
  directClaimForm!: FormGroup;
    states: StateDto[] = [];
    categories: CategoryDto[] = [];
    brands: BrandDto[] = [];
    cities: CitiesDto[] = [];
    pincodes: PincodeDto[] = [];
    product: PlanDto[] = [];
    filteredWarrantyTypes$!: Observable<WarrantyTypeDto[]>;
    selectedStateId: number | null = null;
    selectedCityId: number | null = null;
    selectedCategory: number | null = null;
    selectedBrand: number | null = null;
    selectedProduct: number | null = null;
    warrantyTypes: WarrantyTypeDto[] = [];
    filteredStates$!: Observable<StateDto[]>;
    filteredCities$!: Observable<CitiesDto[]>;
    filteredcategories$!: Observable<CategoryDto[]>;
    filteredBrands$!: Observable<BrandDto[]>;
    filteredPincodes$!: Observable<PincodeDto[]>;
    filteredProduct$!: Observable<PlanDto[]>;
  constructor(private fb: FormBuilder, private http: HttpClient, private apiService: ApiService, private dialog: MatDialog) { }
 private toast = inject(ToastService);
  ngOnInit(): void {
    this.directClaimForm = this.fb.group({
      technicianName: [''],
      lmStatus: [''],
      itemName: ['',Validators.required],
      serchcustomerPhone: [null],
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
      brandName: ['',Validators.required],
      customerState: ['',Validators.required],
      sgst: [''],
      cgst: [''],
      igst: [''],
      SLANo: ['']
    });

      forkJoin({
              states: this.apiService.getStates(),
              cities: this.apiService.getCities(),
              pincodes: this.apiService.getPincodes(),
              warrantyTypes: this.apiService.getWarrantyTypes(),
              plans: this.apiService.getPlans(),
              category: this.apiService.getCategories(),
              brand: this.apiService.getBrands(),
            }).subscribe({
              next: (result) => {
                this.states = result.states.data;
                this.cities = result.cities.data;
                this.pincodes = result.pincodes.data;
                this.warrantyTypes = result.warrantyTypes.data;
                this.product = result.plans.data.filter(x => x.isDisable);
                this.categories = result.category.data.filter(x => x.isDisable);
                this.brands = result.brand.data.filter(x => x.isDisable);
                this.setupAutocompleteFilters();
              }
            });
  }

private setupAutocompleteFilters() {
 this.filteredWarrantyTypes$ = this.directClaimForm.get('warrantyTypeId')!.valueChanges.pipe(
      startWith(''),
      map(v => typeof v === 'string' ? v : v?.name),
      map(name => name ? this.warrantyTypes.filter(wt => wt.name.toLowerCase().includes(name.toLowerCase())) : this.warrantyTypes)
    );

    this.filteredStates$ = this.directClaimForm.get('stateId')!.valueChanges.pipe(
      startWith(''),
      map(v => typeof v === 'string' ? v : v?.name || ''),
      map(name => name ? this.states.filter(s => s.name.toLowerCase().includes(name.toLowerCase())) : this.states)
    );

    this.filteredCities$ = this.directClaimForm.get('cityId')!.valueChanges.pipe(
      startWith(''),
      map(v => typeof v === 'string' ? v : v?.name || ''),
      map(name => name 
        ? this.cities.filter(c => c.stateId === this.selectedStateId && c.name.toLowerCase().includes(name.toLowerCase()))
        : this.cities.filter(c => c.stateId === this.selectedStateId))
    );
 this.filteredcategories$ = this.directClaimForm.get('categoryName')!.valueChanges.pipe(
      startWith(''),
      map(v => typeof v === 'string' ? v : v?.catName || ''),
      map(catName => catName ? this.categories.filter(s => s.name.toLowerCase().includes(catName.toLowerCase())) : this.categories)
    );

this.filteredBrands$ = this.directClaimForm.get('brandId')!.valueChanges.pipe(
        startWith(''),
        map(value => typeof value === 'string' ? value : value?.brandName || ''),
        map(brandName => this.brands.filter(c => 
   c.categoryId === this.selectedCategory &&
   c.brandName.toLowerCase().includes(brandName.toLowerCase())
))
      );
    this.filteredPincodes$ = this.directClaimForm.get('pinCodeId')!.valueChanges.pipe(
      startWith(''),
      map(v => typeof v === 'string' ? v : v?.pincode?.toString() || ''),
      map(code => code 
        ? this.pincodes.filter(p => p.cityId === this.selectedCityId && p.pincode.toString().includes(code))
        : this.pincodes.filter(p => p.cityId === this.selectedCityId))
    );
     this.filteredProduct$ = this.directClaimForm.get('productId')!.valueChanges.pipe(
      startWith(''),
      map(v => typeof v === 'string' ? v : v?.planName?.toString() || ''),
      map(code => code 
        ? this.product.filter(p => p.brandId === this.selectedBrand && p.planName.toString().includes(code))
        : this.product.filter(p => p.brandId === this.selectedBrand))
    );

  }
 
  onWarrantyTypeSelected(wt: WarrantyTypeDto) { this.directClaimForm.patchValue({ warrantyTypeId: wt }); }
  onStateSelected(state: StateDto) { this.selectedStateId = state.id; this.selectedCityId = null; this.showCities(); this.showPincode(); }
  onCitySelected(city: CitiesDto) { this.selectedCityId = city.id; this.showPincode(); }
  onCategorySelected(s: CategoryDto) {
    this.selectedCategory = s.id;
    this.selectedBrand = null;
    this.directClaimForm.patchValue({ brandId: null,itemName :null});
    this.showBrand();this.showProduct();
  }

  onBrandSelected(c: BrandDto) {
    this.selectedBrand = c.id;
    this.directClaimForm.patchValue({ brandId: null,itemName :null});
    this.showProduct();
  }



  displayWarrantyType(wt: WarrantyTypeDto | null) { return wt ? wt.name : ''; }
  displayState(state: StateDto | null) { return state ? state.name : ''; }
  displayCities(city: CitiesDto | null) { return city ? city.name : ''; }
  displayCategory(category: CategoryDto | null) { return category ? category.catName : ''; }
  displayBrand(brand: BrandDto | null) { return brand ? brand.brandName : ''; }
  displayPincodes(pin: PincodeDto | null) { return pin ? pin.pincode.toString() : ''; }
  displayProduct(plan: PlanDto | null) { return plan ? plan.planName : ''; }
  showAllWarrantyTypes() { this.filteredWarrantyTypes$ = of(this.warrantyTypes); }
  showState() { this.filteredStates$ = of(this.states); }
   showCategory() {
    this.filteredcategories$ = of(this.categories);
  }
  showBrand() {  this.filteredBrands$ = of(
    this.brands.filter(b => b.categoryId === this.selectedCategory)
  );}
  showCities() { this.filteredCities$ = of(this.cities.filter(c => c.stateId === this.selectedStateId)); }
  showPincode() { this.filteredPincodes$ = of(this.pincodes.filter(p => p.cityId === this.selectedCityId)); }
  showProduct() { this.filteredProduct$ = of(this.product.filter(p => p.brandId === this.selectedBrand)); }

  onSubmit(): void {
 this.directClaimForm.patchValue({
        servicePartnerName:"",
        servicePartner:"0",
        claimApproved:"0",
        channelId:"0",
        channelName:"",
        createdTime:"16:04:56.0000000",
        servicePartnerCity:"",
        status:"0",
        servicePartnerPhone:"",
        created:"2025-07-18",
        servicePartnerGST:"",
        solvyGST:"",
        paymentDone:"",
        servicePartnerPincode:"0",
        insured:"NOT_INSURED",
        statusName:"",
        servicePartnerPAN:"",
        servicePartnerAddress:"",
        storeName:"",
        previousStatus:"0",
        registeredBy:"0",
        item:"0",
        registeredByName:"",
        createdDate:"2025-07-18",
        claimType:"0",
        appointment:"0",
        solvyStateCode:"0"       
    });
 const allFormData = this.directClaimForm.value;
  const item = allFormData.itemName;
    const warrantyType = allFormData.warrantyType;
    const customerPincode = allFormData.customerPincode;
     const customerState = allFormData.customerState;
    
      const formData = {
      ...this.directClaimForm.value,
      
      claimRegisteredPhoneNumber: this.directClaimForm.value.customerMobileNo,
      categoryName:  item?.catId ?? null,
      itemCategory:  item?.categoryName ?? null,
      itemCategoryId:  item?.catId ?? null,
      brandName: item?.brandName ?? '',
      planSoldDate: this.directClaimForm.value.planSoldDate.toISOString().slice(0, 10),
      displayName:item?.planName ?? null,
      solvyPan:item?.planName ?? null,
      itemBrand:item?.brandId ?? '',
      warrantyStartDate:"0000-00-00",
      pincode:customerPincode?.id ?? 0,
      address:this.directClaimForm.value.customerAddress,
      warrantyDuration:5,
      customerState:customerState?.id,
      customerCity:customerPincode?.cityId,
      warrantyTypeId:warrantyType?.id ?? 0,
    };

    if (this.directClaimForm.valid) {  
        this.apiService.postClaim(formData).subscribe({
        next: () => {
          this.toast.success('Warranty Created Successfully!');this.directClaimForm.reset(); 
        },
        error: (err) => this.toast.error(err?.error || 'Error creating Warranty!')
      });
    }
  }
}
