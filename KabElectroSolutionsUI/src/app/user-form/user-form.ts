import { Component, inject, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { HttpClient } from '@angular/common/http';
import { Observable, of, startWith, map, forkJoin } from 'rxjs';
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
import { ApiService, CitiesDto, PincodeDto, StateDto, ServicePartnerDto, Role } from '../services/api.service';
import { ToastService } from '../services/toastService.service';

@Component({
  selector: 'app-user-form',
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
  templateUrl: './user-form.html',
  styleUrl: './user-form.css'
})
export class UserFormComponent implements OnInit {
  userForm!: FormGroup;
  mode: 'add' | 'edit' = 'add';
  submitBtnLabel: string = 'Submit User';
  title: string = 'Create User';

  states: StateDto[] = [];
  cities: CitiesDto[] = [];
  pincodes: PincodeDto[] = [];
  roles: Role[] = [];

  filteredStates$!: Observable<StateDto[]>;
  filteredCities$!: Observable<CitiesDto[]>;
  filteredPincodes$!: Observable<PincodeDto[]>;

  selectedStateId: number | null = null;
  selectedCityId: number | null = null;

  private fb = inject(FormBuilder);
  private apiService = inject(ApiService);
  private toast = inject(ToastService);
  private dialogRef = inject(MatDialogRef<UserFormComponent>);
  private data = inject(MAT_DIALOG_DATA) as { mode: 'add' | 'edit'; record?: ServicePartnerDto };

  ngOnInit(): void {

    // ✅ Create the form FIRST (prevents NG01052 error)
    this.userForm = this.fb.group({
      firstName:[null, Validators.required],
      lastName:[null, Validators.required],
      phone: [null, Validators.required],
      email: [null, [Validators.required, Validators.email]],
      address: [null, Validators.required],
      stateId: [null, Validators.required],  // stores object
      cityId: [null, Validators.required],   // stores object
      pinCodeId: [null, Validators.required],// stores object
      roleId: ['', Validators.required]      // stores roleId only
    });

    // ✅ Load all API data together
    forkJoin({
      states: this.apiService.getStates(),
      cities: this.apiService.getCities(),
      pincodes: this.apiService.getPincodes(),
      roles: this.apiService.getRoles()
    }).subscribe({
      next: (result) => {
        this.states = result.states.data;
        this.cities = result.cities.data;
        this.pincodes = result.pincodes.data;
        this.roles = result.roles;

        this.setupAutocompleteFilters();

        if (this.data.mode === 'edit') {
          this.mode = 'edit';
          this.title = 'Edit User';
          this.submitBtnLabel = 'Update User';
          this.patchEditData();
        }
      }
    });

  }

  // ✅ Perfect edit patching (no errors)
  private patchEditData() {
    const record = this.data.record!;

    const stateObj = this.states.find(s => s.id === record.stateId) || null;
    const cityObj = this.cities.find(c => c.id === record.cityId) || null;
    const pinObj = this.pincodes.find(p => p.id === record.pinCodeId) || null;

    this.selectedStateId = record.stateId;
    this.selectedCityId = record.cityId;

    this.userForm.patchValue({
      firstName: record.firstName,
      lastName: record.lastName,
      phone: record.phone,
      email: record.email,
      address: record.address,
      stateId: stateObj,
      cityId: cityObj,
      pinCodeId: pinObj,
      roleId: record.roleId
    });

    this.showCities();
    this.showPincode();
  }

  // Autocomplete setup
  private setupAutocompleteFilters() {

    this.filteredStates$ = this.userForm.get('stateId')!.valueChanges.pipe(
      startWith(''),
      map(value => typeof value === 'string' ? value : value?.name || ''),
      map(name => name ? this.states.filter(st => st.name.toLowerCase().includes(name.toLowerCase())) : this.states)
    );

    this.filteredCities$ = this.userForm.get('cityId')!.valueChanges.pipe(
      startWith(''),
      map(value => typeof value === 'string' ? value : value?.name || ''),
      map(name => this.cities.filter(c => 
        c.stateId === this.selectedStateId &&
        c.name.toLowerCase().includes(name.toLowerCase())
      ))
    );

    this.filteredPincodes$ = this.userForm.get('pinCodeId')!.valueChanges.pipe(
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
    this.userForm.patchValue({ cityId: null, pinCodeId: null });
    this.showCities();
    this.showPincode();
  }

  onCitySelected(c: CitiesDto) {
    this.selectedCityId = c.id;
    this.userForm.patchValue({ pinCodeId: null });
    this.showPincode();
  }

  // Submit handler
  onSubmit() {
    if (this.userForm.invalid) {
      this.toast.error('Please fill all required fields correctly.');
      return;
    }

    const f = this.userForm.value;

    const payload = {
      ...f,
      stateId: f.stateId.id,
      cityId: f.cityId.id,
      pinCodeId: f.pinCodeId.id,
    };

    if (this.mode === 'edit' && this.data.record) {
      this.apiService.updateUser(this.data.record.id, payload).subscribe({
        next: () => { this.toast.success("User Updated"); this.dialogRef.close('success'); }
      });
    } else {
      this.apiService.postUser(payload).subscribe({
        next: () => { this.toast.success("User Created"); this.dialogRef.close('success'); }
      });
    }
  }

  onClose() { this.dialogRef.close(); }
}
