import { Component, inject, OnInit } from '@angular/core';
import { ReactiveFormsModule, FormBuilder, FormGroup, Validators, FormControl } from '@angular/forms';
import { HttpClient } from '@angular/common/http';
import { Observable, startWith, map, of } from 'rxjs';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { MatInputModule } from '@angular/material/input';
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { CommonModule } from '@angular/common';
import { MatSelectModule } from '@angular/material/select';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { MatNativeDateModule } from '@angular/material/core';
import { MatAutocompleteModule } from '@angular/material/autocomplete';
import { ApiService, CitiesDto, LocationResponseDto, PincodeDto, StateDto, WarrantyTypeDto, PlanDto } from '../services/api.service';
import { MatDialogRef } from '@angular/material/dialog';

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
    MatAutocompleteModule
  ],
  templateUrl: './warranty-form.html',
  styleUrl: './warranty-form.css'
})
export class WarrantyFormComponent implements OnInit {
 warrantyForm!: FormGroup;
 warrantyTypes:WarrantyTypeDto[]=[];
 filteredWarrantyTypes$!: Observable<WarrantyTypeDto[]>;
 stateIds: string[] = [];
  cityIds: string[] = [];
  pincodes: PincodeDto[] = [];
  states: StateDto[] = [];
  cities: CitiesDto[] = [];
 selectedStateId: number | null = null;
  selectedCityId: number | null = null;

  // filtered observables
  filteredStates$!: Observable<StateDto[]>;
  filteredCities$!: Observable<CitiesDto[]>;
  filteredPincodes$!: Observable<PincodeDto[]>;

  customerState = new FormControl('');
  locations: LocationResponseDto['data'] = {};
  private dialogRef = inject(MatDialogRef<WarrantyFormComponent>);
constructor(private fb: FormBuilder, private http: HttpClient,private apiService: ApiService) { }
ngOnInit(): void {
    this.apiService.getWarrantyTypes().subscribe(res => {
      this.warrantyTypes = res.data;
    });
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
  this.warrantyForm = this.fb.group({
  warrantySerialNumber:[null, Validators.required],
  warrantyTypeId: [null, Validators.required],
  warrantyCode: [null, Validators.required],
  warrantyDisplayName: [null, Validators.required],
  warrantyPrice: [null,  Validators.pattern('^[0-9]+(\\.[0-9]+)?$')],
  warrantyDuration: [null,Validators.pattern('^[0-9]*$')],
  warrantyStartDate: [null,Validators.required],
  warrantyEndDate: [null,Validators.required],
  warrantyInvoiceNo: [null, Validators.required],
  warrantyPurchaseDate: [null, Validators.required],
  warrantySeller: [null],
  warrantyCouponCode: [null],
  warrantyScratchCode: [null],
  warrantyExtraInfo: [null],
  warrantyDescription: [null],
  warrantyCreatedBy: [null],
  productId: [null,Validators.required],
  customerName:[null,Validators.required],
  customerMobileNo:[null,Validators.required],
  customerEmail: [null,Validators.required],
  customerAddress: [null,Validators.required],
  customerCityId: [null,Validators.required],
  customerStateId: [null,Validators.required],
  customerPinCode: [null,Validators.required],
  isDisable:[true]
    });

     this.warrantyForm.get('customerCity')!.valueChanges.subscribe(cityId => {
      const stateId = this.selectedStateId;
      // this.pincodes = (stateId && cityId)
      //   ? this.locations[stateId].cities[cityId].pincodes
      //   : [];
      // this.claimForm.patchValue({ customerPincode: '' });
    });

    this.filteredWarrantyTypes$ = this.warrantyForm.get('warrantyType')!.valueChanges.pipe(
      startWith(''),
      map(value => this._filterWarrantyTypes(value || ''))
    );


    this.filteredStates$ = this.warrantyForm.get('customerState')!.valueChanges.pipe(
      startWith(''),
      map(value => this._filterStates(value || ''))
    );

    this.filteredCities$ = this.warrantyForm.get('customerCity')!.valueChanges.pipe(
      startWith(''),
      map(value => this._filterCities(value || '', this.cities))
    );

    this.filteredPincodes$ = this.warrantyForm.get('customerPincode')!.valueChanges.pipe(
      startWith(''),
      map(value => this._filterPincodes(value || '', this.pincodes))
    );
  }

  showAllStates(): void {
    this.warrantyForm.get('customerState')!.setValue('');
  }

 private _filterWarrantyTypes(value: string): WarrantyTypeDto[] {
    const filterValue = value.toLowerCase();
    return this.warrantyTypes.filter(warrantyType =>
      warrantyType.name.toLowerCase().includes(filterValue)
    );
  }
  private _filterStates(value: string): StateDto[] {
    const filterValue = value.toLowerCase();
    return this.states.filter(state =>
      state.name.toLowerCase().includes(filterValue)
    );
  }

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

  
  showAllWarrantyTypes() {
  this.filteredWarrantyTypes$ = of(this.warrantyTypes);
  }

 onStateSelected(stateId: number) {
    this.selectedStateId = stateId;
    const stateCities = this.cities.filter(c => c.stateId === stateId);
    this.filteredCities$ = this.warrantyForm.get('customerCity')!.valueChanges.pipe(
      startWith(''),
      map(value => this._filterCities(value || '', stateCities))
    );  
    this.warrantyForm.patchValue({ customerCity: null });
  }

 onCitySelected(cityId: number) {
    this.selectedCityId = cityId;
    const cityPincodes = this.pincodes.filter(c => c.cityId === cityId);    

    this.filteredPincodes$ = this.warrantyForm.get('customerPincode')!.valueChanges.pipe(
      startWith(''),
      map(value => this._filterPincodes(value || '',cityPincodes))
    );
    this.warrantyForm.patchValue({ customerPincode: '' });
  }

  onSubmit(): void {
    if (this.warrantyForm.valid) {
      this.http.post('/api/Warranty', this.warrantyForm.value).subscribe({
        next: (res) => console.log('warranty created:', res),
        error: (err) => console.error('Error creating warranty:', err)
      });
    }
  }
 onClose() {
    this.dialogRef.close();
  }
}
