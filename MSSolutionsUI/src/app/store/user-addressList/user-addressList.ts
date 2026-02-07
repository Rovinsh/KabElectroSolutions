import { Component, inject, Inject, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { MAT_DIALOG_DATA, MatDialogModule, MatDialogRef } from '@angular/material/dialog';
import { AddressDto, ApiService, CitiesDto, PincodeDto, StateDto } from '../../services/api.service';
import { CommonModule } from '@angular/common';
import { forkJoin, map, Observable, of, startWith } from 'rxjs';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatAutocompleteModule } from '@angular/material/autocomplete';
import { MatOptionModule } from '@angular/material/core';
import { ToastService } from '../../services/toastService.service';

@Component({
  selector: 'app-user-addressList',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule,  MatDialogModule,
    MatFormFieldModule,
    MatInputModule,
    MatAutocompleteModule,
    MatOptionModule],
  templateUrl: './user-addressList.html',
  styleUrls: ['./user-addressList.css']
})
export class UserAddress implements OnInit {

  addresses: AddressDto[] = [];
  // Selected addresses
  selectedShippingAddress?: AddressDto;
  selectedBillingAddress?: AddressDto;
  form!: FormGroup;
  addAddressForm!: FormGroup;
 states: StateDto[] = [];
  cities: CitiesDto[] = [];
  pincodes: PincodeDto[] = [];
  filteredStates$!: Observable<StateDto[]>;
  filteredCities$!: Observable<CitiesDto[]>;
  filteredPincodes$!: Observable<PincodeDto[]>;
  private toast = inject(ToastService);
  selectedStateId: number | null = null;
  selectedCityId: number | null = null;
  showAddForm = false;
  useShippingAsBilling = true;
  constructor(
    private fb: FormBuilder,
    private apiService: ApiService,
  ) {}

  ngOnInit(): void {
  this.loadAddress();
    this.addAddressForm = this.fb.group({
      fullName: ['', Validators.required],
      phone: [null, [Validators.required,Validators.pattern(/^[6-9]\d{9}$/)]],
      addressLine: ['', Validators.required],
      cityId: ['', Validators.required],
      stateId: ['', Validators.required],
      pincodeId: ['', Validators.required]
    });

    forkJoin({
          states: this.apiService.getStates(),
          cities: this.apiService.getCities(),
          pincodes: this.apiService.getPincodes(),
        }).subscribe({
          next: (result) => {
            this.states = result.states.data;
            this.cities = result.cities.data;
            this.pincodes = result.pincodes.data;  
            this.setupAutocompleteFilters();
          }
        });
    
  }

  loadAddress(){
  this.apiService.getUserAddresses().subscribe(res => {
  this.addresses = res.data; 
  // Optional: set default shipping/billing
  this.selectedShippingAddress = this.addresses.find(a => a.isDefault);
  if (this.useShippingAsBilling) {
    this.selectedBillingAddress = this.selectedShippingAddress;
  }
});
}
   // Autocomplete setup
    private setupAutocompleteFilters() {
      this.filteredStates$ = this.addAddressForm.get('stateId')!.valueChanges.pipe(
        startWith(''),
        map(value => typeof value === 'string' ? value : value?.name || ''),
        map(name => name ? this.states.filter(st => st.name.toLowerCase().includes(name.toLowerCase())) : this.states)
      );
  
      this.filteredCities$ = this.addAddressForm.get('cityId')!.valueChanges.pipe(
        startWith(''),
        map(value => typeof value === 'string' ? value : value?.name || ''),
        map(name => this.cities.filter(c => 
          c.stateId === this.selectedStateId &&
          c.name.toLowerCase().includes(name.toLowerCase())
        ))
      );
  
      this.filteredPincodes$ = this.addAddressForm.get('pincodeId')!.valueChanges.pipe(
        startWith(''),
        map(value => typeof value === 'string' ? value : value?.pincode?.toString() || ''),
        map(p => this.pincodes.filter(pin =>
          pin.cityId === this.selectedCityId &&
          pin.pincode.toString().includes(p)
        ))
      );
  
    }
  
    // Display functions
    displayState(state: StateDto | null) { return state?.name ?? ''; }
    displayCities(city: CitiesDto | null) { return city?.name ?? ''; }
    displayPincodes(pin: PincodeDto | null) { return pin?.pincode.toString() ?? ''; }
    showState() { this.filteredStates$ = of(this.states); }
    showCities() { this.filteredCities$ = of(this.cities.filter(c => c.stateId === this.selectedStateId)); }
    showPincode() { this.filteredPincodes$ = of(this.pincodes.filter(p => p.cityId === this.selectedCityId)); }
  
    onStateSelected(s: StateDto) {
      this.selectedStateId = s.id;
      this.selectedCityId = null;
      this.addAddressForm.patchValue({ cityId: null, pincodeId: null });
      this.showCities();
      this.showPincode();
    }
  
    onCitySelected(c: CitiesDto) {
      this.selectedCityId = c.id;
      this.addAddressForm.patchValue({ pincodeId: null });
      this.showPincode();
    }

  addAddress() {
    if (this.addAddressForm.invalid) return;
    const f = this.addAddressForm.value;

    const payload = {
      ...f,
      state: f.stateId.name,
      city: f.cityId.name,
      pincode: f.pincodeId.pincode,
      stateId:f.stateId.id,
      pincodeId:f.pincodeId.id,
      cityId:f.cityId.id,
      isDefault:true
    };

    this.apiService.postUserAddress(payload)
      .subscribe(res => {
         this.toast.success('Address add Successfully!');
        this.addAddressForm.reset();
          this.loadAddress();
      });
  }
}
