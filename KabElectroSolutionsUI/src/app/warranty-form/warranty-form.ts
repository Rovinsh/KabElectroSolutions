import { Component, inject, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { HttpClient } from '@angular/common/http';
import { Observable, of, startWith, map } from 'rxjs';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { MatInputModule } from '@angular/material/input';
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { CommonModule } from '@angular/common';
import { MatSelectModule } from '@angular/material/select';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { MatNativeDateModule, provideNativeDateAdapter } from '@angular/material/core';
import { MatAutocompleteModule } from '@angular/material/autocomplete';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { ApiService, CitiesDto, PincodeDto, StateDto, WarrantyTypeDto, WarrantyDto, PlanDto } from '../services/api.service';
import { ToastService } from '../services/toastService.service';

@Component({
  selector: 'app-warranty-form',
  imports: [
    ReactiveFormsModule,
    MatFormFieldModule,
    MatInputModule,
    MatButtonModule,
    MatDatepickerModule,
    MatCheckboxModule,
    MatCardModule,
    CommonModule,
    MatNativeDateModule,
    MatSelectModule,
    MatAutocompleteModule,
  ],
  providers: [provideNativeDateAdapter()],
  templateUrl: './warranty-form.html',
  styleUrls: ['./warranty-form.css'],
})
export class WarrantyFormComponent implements OnInit {
  warrantyForm!: FormGroup;
  mode: 'add' | 'edit' = 'add';
  submitBtnLabel: string = 'Submit Warranty';
  title: string = 'Create Warranty';

  warrantyTypes: WarrantyTypeDto[] = [];
  states: StateDto[] = [];
  cities: CitiesDto[] = [];
  pincodes: PincodeDto[] = [];
  product: PlanDto[] = [];

  filteredWarrantyTypes$!: Observable<WarrantyTypeDto[]>;
  filteredStates$!: Observable<StateDto[]>;
  filteredCities$!: Observable<CitiesDto[]>;
  filteredPincodes$!: Observable<PincodeDto[]>;
  filteredProduct$!: Observable<PlanDto[]>;

  selectedStateId: number | null = null;
  selectedCityId: number | null = null;

  private fb = inject(FormBuilder);
  private http = inject(HttpClient);
  private apiService = inject(ApiService);
  private toast = inject(ToastService);
  private dialogRef = inject(MatDialogRef<WarrantyFormComponent>);
  private data = inject(MAT_DIALOG_DATA) as { mode: 'add' | 'edit'; record?: WarrantyDto };

  ngOnInit(): void {
    this.apiService.getWarrantyTypes().subscribe(res => (this.warrantyTypes = res.data));
    this.apiService.getStates().subscribe(res => (this.states = res.data));
    this.apiService.getCities().subscribe(res => (this.cities = res.data));
    this.apiService.getPincodes().subscribe(res => (this.pincodes = res.data));
    this.apiService.getPlans().subscribe(res => (this.product = res.data));

    this.warrantyForm = this.fb.group({
      serialNumber: [null, [Validators.required, Validators.pattern('^[0-9]*$')]],
      warrantyTypeId: [null, Validators.required],
      warrantyCode: [null, Validators.required],
      warrantyDisplayName: [null, Validators.required],
      warrantyPrice: [null, [Validators.required, Validators.pattern('^[0-9]+(\\.[0-9]+)?$')]],
      warrantyDuration: [null, [Validators.required, Validators.pattern('^[0-9]*$')]],
      warrantyStartDate: [null, Validators.required],
      warrantyEndDate: [null, Validators.required],
      warrantyInvoiceNo: [null, Validators.required],
      warrantyPurchaseDate: [null, Validators.required],
      productId: [null],
      warrantySeller: [null],
      warrantyCouponCode: [null],
      warrantyScratchCode: [null],
      warrantyExtraInfo: [null],
      warrantyDescription: [null],
      warrantyCreatedBy: [null],
      customerName: [null, Validators.required],
      itemSerialNumber:[null, Validators.required],
      customerMobileNo: [null, Validators.required],
      customerEmail: [null, [Validators.required, Validators.email]],
      customerAddress: [null, Validators.required],
      stateId: [null, Validators.required],
      cityId: [null, Validators.required],
      pinCodeId: [null, Validators.required],
      isDisable: [true],
    });

    this.setupAutocompleteFilters();

    if (this.data?.mode === 'edit' && this.data.record) {
      this.mode = 'edit';
      this.title = 'Edit Warranty';
      this.submitBtnLabel = 'Update Warranty';
      setTimeout(() => this.patchEditData(), 0);
    }
  }

  private patchEditData() {
    const record = this.data.record!;
    this.selectedStateId = record.stateId;
    this.selectedCityId = record.cityId;

    this.warrantyForm.patchValue({
      serialNumber: record.serialNumber,
      warrantyTypeId: this.warrantyTypes.find(wt => wt.id === record.warrantyTypeId) || null,
      warrantyCode: record.warrantyCode,
      warrantyDisplayName: record.warrantyDisplayName,
      warrantyPrice: record.warrantyPrice,
      warrantyDuration: record.warrantyDuration,
      warrantyStartDate: record.warrantyStartDate ? new Date(record.warrantyStartDate) : null,
      warrantyEndDate: record.warrantyEndDate ? new Date(record.warrantyEndDate) : null,
      warrantyInvoiceNo: record.warrantyInvoiceNo,
      warrantyPurchaseDate: record.warrantyPurchaseDate ? new Date(record.warrantyPurchaseDate) : null,
      warrantySeller: record.warrantySeller,
      warrantyCouponCode: record.warrantyCouponCode,
      warrantyScratchCode: record.warrantyScratchCode,
      warrantyExtraInfo: record.warrantyExtraInfo,
      warrantyDescription: record.warrantyDescription,
      warrantyCreatedBy: record.warrantyCreatedBy,
      productId: this.product.find(p => p.id === record.productId) || null,
      customerName: record.customerName,
      itemSerialNumber:record.itemSerialNumber,
      customerMobileNo: record.customerMobileNo,
      customerEmail: record.customerEmail,
      customerAddress: record.customerAddress,
      stateId: this.states.find(s => s.id === record.stateId) || null,
      cityId: this.cities.find(c => c.id === record.cityId) || null,
      pinCodeId: this.pincodes.find(p => p.id === record.pinCodeId) || null,
      isDisable: !!record.isDisable
    });

    this.showCities();
    this.showPincode();
  }

  private setupAutocompleteFilters() {
    this.filteredWarrantyTypes$ = this.warrantyForm.get('warrantyTypeId')!.valueChanges.pipe(
      startWith(''),
      map(v => typeof v === 'string' ? v : v?.name),
      map(name => name ? this.warrantyTypes.filter(wt => wt.name.toLowerCase().includes(name.toLowerCase())) : this.warrantyTypes)
    );

    this.filteredStates$ = this.warrantyForm.get('stateId')!.valueChanges.pipe(
      startWith(''),
      map(v => typeof v === 'string' ? v : v?.name || ''),
      map(name => name ? this.states.filter(s => s.name.toLowerCase().includes(name.toLowerCase())) : this.states)
    );

    this.filteredCities$ = this.warrantyForm.get('cityId')!.valueChanges.pipe(
      startWith(''),
      map(v => typeof v === 'string' ? v : v?.name || ''),
      map(name => name 
        ? this.cities.filter(c => c.stateId === this.selectedStateId && c.name.toLowerCase().includes(name.toLowerCase()))
        : this.cities.filter(c => c.stateId === this.selectedStateId))
    );

    this.filteredPincodes$ = this.warrantyForm.get('pinCodeId')!.valueChanges.pipe(
      startWith(''),
      map(v => typeof v === 'string' ? v : v?.pincode?.toString() || ''),
      map(code => code 
        ? this.pincodes.filter(p => p.cityId === this.selectedCityId && p.pincode.toString().includes(code))
        : this.pincodes.filter(p => p.cityId === this.selectedCityId))
    );

    this.filteredProduct$ = this.warrantyForm.get('productId')!.valueChanges.pipe(
      startWith(''),
      map(v => typeof v === 'string' ? v : v?.planName || ''),
      map(name => name ? this.product.filter(p => p.planName.toLowerCase().includes(name.toLowerCase())) : this.product)
    );
  }

  onWarrantyTypeSelected(wt: WarrantyTypeDto) { this.warrantyForm.patchValue({ warrantyTypeId: wt }); }
  onStateSelected(state: StateDto) { this.selectedStateId = state.id; this.selectedCityId = null; this.warrantyForm.patchValue({ stateId: state, cityId: null, pinCodeId: null }); this.showCities(); this.showPincode(); }
  onCitySelected(city: CitiesDto) { this.selectedCityId = city.id; this.warrantyForm.patchValue({ cityId: city, pinCodeId: null }); this.showPincode(); }

  displayWarrantyType(wt: WarrantyTypeDto | null) { return wt ? wt.name : ''; }
  displayState(state: StateDto | null) { return state ? state.name : ''; }
  displayCities(city: CitiesDto | null) { return city ? city.name : ''; }
  displayPincodes(pin: PincodeDto | null) { return pin ? pin.pincode.toString() : ''; }
  displayProduct(plan: PlanDto | null) { return plan ? plan.planName : ''; }

  showAllWarrantyTypes() { this.filteredWarrantyTypes$ = of(this.warrantyTypes); }
  showState() { this.filteredStates$ = of(this.states); }
  showCities() { this.filteredCities$ = of(this.cities.filter(c => c.stateId === this.selectedStateId)); }
  showPincode() { this.filteredPincodes$ = of(this.pincodes.filter(p => p.cityId === this.selectedCityId)); }
  showAllProduct() { this.filteredProduct$ = of(this.product); }

  onSubmit() {
    if (this.warrantyForm.invalid) {
      this.toast.error('Please fill all required fields correctly.');
      return;
    }

    const formValue = this.warrantyForm.value;
    const formData = {
      ...formValue,
      warrantyTypeId: formValue.warrantyTypeId?.id || formValue.warrantyTypeId,
      stateId: formValue.stateId?.id || formValue.stateId,
      cityId: formValue.cityId?.id || formValue.cityId,
      productId: formValue.productId?.id || formValue.productId,
      pinCodeId: formValue.pinCodeId?.id || formValue.pinCodeId,
      isDisable: !!formValue.isDisable
    };

    if (this.mode === 'edit' && this.data.record) {
      this.apiService.updateWarranties(this.data.record.id, formData).subscribe({
        next: () => { this.toast.success('Warranty Updated Successfully!'); this.dialogRef.close('success');
          this.warrantyForm.reset(); },
        error: err => this.toast.error(err?.error || 'Error updating Warranty!')
      });
    } else {
      this.apiService.postWarranties(formData).subscribe({
        next: () => { this.toast.success('Warranty Created Successfully!'); this.dialogRef.close('success');this.warrantyForm.reset();  },
        error: err => this.toast.error(err?.error || 'Error creating Warranty!')
      });
    }
  }

  onClose() { this.dialogRef.close(); }
}
