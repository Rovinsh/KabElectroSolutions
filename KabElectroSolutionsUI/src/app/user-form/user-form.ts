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
import { ApiService, CitiesDto, PincodeDto, StateDto,ServicePartnerDto,Role } from '../services/api.service';
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
  selectedRoleId: number | null = null;

  private fb = inject(FormBuilder);
  private http = inject(HttpClient);
  private apiService = inject(ApiService);
  private toast = inject(ToastService);
  private dialogRef = inject(MatDialogRef<UserFormComponent>);
  private data = inject(MAT_DIALOG_DATA) as { mode: 'add' | 'edit'; record?: ServicePartnerDto };

  ngOnInit(): void {
    this.apiService.getStates().subscribe(res => (this.states = res.data));
    this.apiService.getCities().subscribe(res => (this.cities = res.data));
    this.apiService.getPincodes().subscribe(res => (this.pincodes = res.data));
    this.getRoles();
    this.userForm = this.fb.group({
      firstName:[null, Validators.required],
      lastName:[null, Validators.required],
      phone: [null, Validators.required],
      email: [null, [Validators.required, Validators.email]],
      address: [null, Validators.required],
      stateId: [null, Validators.required],
      cityId: [null, Validators.required],
      pinCodeId: [null, Validators.required],
      roleId: ['', Validators.required]
    });

    this.setupAutocompleteFilters();

    if (this.data?.mode === 'edit' && this.data.record) {
      this.mode = 'edit';
      this.title = 'Edit User';
      this.submitBtnLabel = 'Update User';
      setTimeout(() => this.patchEditData(), 0);
    }
  }

   getRoles(){
    this.apiService.getRoles().subscribe(res => {
      this.roles = res;
    });
   }

  private patchEditData() {
    const record = this.data.record!;
    this.selectedStateId = record.stateId;
    this.selectedCityId = record.cityId;
    this.selectedRoleId = record.roleId;

    this.userForm.patchValue({
      firstName: record.firstName,
      lastName: record.lastName,
      phone: record.phone,
      email: record.email,
      address: record.address,
      stateId: this.states.find(s => s.id === record.stateId) || null,
      cityId: this.cities.find(c => c.id === record.cityId) || null,
      pinCodeId: this.pincodes.find(p => p.id === record.pinCodeId) || null,
      roleId: record.roleId,
    });

    this.showCities();
    this.showPincode();
  }

  private setupAutocompleteFilters() {
 
    this.filteredStates$ = this.userForm.get('stateId')!.valueChanges.pipe(
      startWith(''),
      map(v => typeof v === 'string' ? v : v?.name || ''),
      map(name => name ? this.states.filter(s => s.name.toLowerCase().includes(name.toLowerCase())) : this.states)
    );

    this.filteredCities$ = this.userForm.get('cityId')!.valueChanges.pipe(
      startWith(''),
      map(v => typeof v === 'string' ? v : v?.name || ''),
      map(name => name 
        ? this.cities.filter(c => c.stateId === this.selectedStateId && c.name.toLowerCase().includes(name.toLowerCase()))
        : this.cities.filter(c => c.stateId === this.selectedStateId))
    );

    this.filteredPincodes$ = this.userForm.get('pinCodeId')!.valueChanges.pipe(
      startWith(''),
      map(v => typeof v === 'string' ? v : v?.pincode?.toString() || ''),
      map(code => code 
        ? this.pincodes.filter(p => p.cityId === this.selectedCityId && p.pincode.toString().includes(code))
        : this.pincodes.filter(p => p.cityId === this.selectedCityId))
    );

  }

  onStateSelected(state: StateDto) { this.selectedStateId = state.id; this.selectedCityId = null; this.userForm.patchValue({ stateId: state, cityId: null, pinCodeId: null }); this.showCities(); this.showPincode(); }
  onCitySelected(city: CitiesDto) { this.selectedCityId = city.id; this.userForm.patchValue({ cityId: city, pinCodeId: null }); this.showPincode(); }

  displayState(state: StateDto | null) { return state ? state.name : ''; }
  displayCities(city: CitiesDto | null) { return city ? city.name : ''; }
  displayPincodes(pin: PincodeDto | null) { return pin ? pin.pincode.toString() : ''; }


  showState() { this.filteredStates$ = of(this.states); }
  showCities() { this.filteredCities$ = of(this.cities.filter(c => c.stateId === this.selectedStateId)); }
  showPincode() { this.filteredPincodes$ = of(this.pincodes.filter(p => p.cityId === this.selectedCityId)); }

  onSubmit() {
    if (this.userForm.invalid) {
      this.toast.error('Please fill all required fields correctly.');
      return;
    }

    const formValue = this.userForm.value;
    const formData = {
      ...formValue,
      stateId: formValue.stateId?.id || formValue.stateId,
      cityId: formValue.cityId?.id || formValue.cityId,
      pinCodeId: formValue.pinCodeId?.id || formValue.pinCodeId,
    };

    if (this.mode === 'edit' && this.data.record) {
      this.apiService.updateUser(this.data.record.id, formData).subscribe({
        next: () => { this.toast.success('User Data Updated Successfully!'); this.dialogRef.close('success'); },
        error: err => this.toast.error(err?.error || 'Error updating User Data!')
      });
    } else {
      this.apiService.postUser(formData).subscribe({
        next: () => { this.toast.success('User Data Created Successfully!'); this.dialogRef.close('success'); },
        error: err => this.toast.error(err?.error || 'Error creating User Data!')
      });
    }
  }

  onClose() { this.dialogRef.close(); }
}
