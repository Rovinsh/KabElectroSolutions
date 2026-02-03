import { Component, Inject, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { MAT_DIALOG_DATA, MatDialogModule, MatDialogRef } from '@angular/material/dialog';
import { AddressDto, ApiService, CitiesDto, PincodeDto, StateDto } from '../../services/api.service';
import { CommonModule } from '@angular/common';
import { forkJoin, map, Observable, of, startWith } from 'rxjs';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatAutocompleteModule } from '@angular/material/autocomplete';
import { MatOptionModule } from '@angular/material/core';

@Component({
  selector: 'app-user-delivery-address',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule,  MatDialogModule,
    MatFormFieldModule,
    MatInputModule,
    MatAutocompleteModule,
    MatOptionModule],
  templateUrl: './user-delivery-address.html',
  styleUrls: ['./user-delivery-address.css']
})
export class UserDeliveryAddress implements OnInit {

  addresses: AddressDto[] = [];

  form!: FormGroup;
  addAddressForm!: FormGroup;
 states: StateDto[] = [];
  cities: CitiesDto[] = [];
  pincodes: PincodeDto[] = [];
  filteredStates$!: Observable<StateDto[]>;
  filteredCities$!: Observable<CitiesDto[]>;
  filteredPincodes$!: Observable<PincodeDto[]>;

  selectedStateId: number | null = null;
  selectedCityId: number | null = null;
  showAddForm = false;

  constructor(
    private fb: FormBuilder,
    private apiService: ApiService,
    private dialogRef: MatDialogRef<UserDeliveryAddress>,
    @Inject(MAT_DIALOG_DATA) public data: any
  ) {}

  ngOnInit(): void {
    this.addresses = this.data.addresses || [];

    this.form = this.fb.group({
      shippingAddressId: [this.data.selectedShipping?.id, Validators.required],
      billingAddressId: [this.data.selectedBilling?.id],
      useShippingAsBilling: [this.data.useShippingAsBilling ?? true]
    });

    this.addAddressForm = this.fb.group({
      fullName: ['', Validators.required],
      phone: [null, [Validators.required,Validators.pattern(/^[6-9]\d{9}$/)]],
      addressLine: ['', Validators.required],
      cityId: ['', Validators.required],
      stateId: ['', Validators.required],
      pincodeId: ['', Validators.required]
    });

    this.form.get('useShippingAsBilling')?.valueChanges.subscribe(val => {
      if (val) {
        this.form.patchValue({
          billingAddressId: this.form.value.shippingAddressId
        });
      }
    });

    this.form.get('shippingAddressId')?.valueChanges.subscribe(val => {
      if (this.form.value.useShippingAsBilling) {
        this.form.patchValue({ billingAddressId: val });
      }
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
  
 close() {
    this.dialogRef.close(false);
  }
  save() {
    const shipping = this.addresses.find(
      a => a.id === this.form.value.shippingAddressId
    );

    const billing = this.addresses.find(
      a => a.id === this.form.value.billingAddressId
    );

    this.dialogRef.close({
      selectedShipping: shipping,
      selectedBilling: this.form.value.useShippingAsBilling ? shipping : billing,
      useShippingAsBilling: this.form.value.useShippingAsBilling
    });
  }

  cancel() {
    this.dialogRef.close();
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
        const newAddr = res.data;
        this.addresses= res.data;
        this.showAddForm = false;
        this.addAddressForm.reset();
      });
  }
}
