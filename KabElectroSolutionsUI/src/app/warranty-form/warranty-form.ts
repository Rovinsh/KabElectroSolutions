import { Component, OnInit } from '@angular/core';
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
import { ApiService, WarrantyTypeDto } from '../services/api.service';

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

constructor(private fb: FormBuilder, private http: HttpClient,private apiService: ApiService) { }
ngOnInit(): void {

    this.apiService.getWarrantyTypes().subscribe(res => {
      this.warrantyTypes = res.data;
    });

  this.warrantyForm = this.fb.group({
  is_zapp_enable: [false],
  status: [null],
  serialnumber: [null],
  region_id: [null],
  display_name: [''],
  policy_id: [null],
  rm_id: [null],
  activationcode: [''],
  price: [null],
  extrainfo: [''],
  duration: [null],
  product_extra_image: [''],
  discrepancy_reason: [''],
  store_assigned_at: [null],
  active: [true],
  verified: [true],
  distributor_assigned_at: [null],
  warranty_invoice_no: [''],
  startdate: [null],
  enddate: [null],
  product_id: [null],
  discrepants: [''],
  purchasedate: [null],
  endorsement_no: [''],
  seller: [''],
  coupon_code: [''],
  cancellation_at: [null],
  cancellation_done_by: [''],
  scratch_code: [''],
  kit_coverage: [''],
  oem_id: [null],
  brandwarrantyduration: [null],
  cancellation_reason: [''],
  type: [null, Validators.required],
  insured: [''],
  cancellation_role: [''],
  warrantyTypeId: [null],
    });
  }

  showAllWarrantyTypes() {
  this.filteredWarrantyTypes$ = of(this.warrantyTypes);
  }

  private _filterWarrantyTypes(value: string): WarrantyTypeDto[] {
    const filterValue = value.toLowerCase();
    return this.warrantyTypes.filter(warrantyType =>
      warrantyType.name.toLowerCase().includes(filterValue)
    );
  }

  onSubmit(): void {
    if (this.warrantyForm.valid) {
      this.http.post('/api/Warranty', this.warrantyForm.value).subscribe({
        next: (res) => console.log('warranty created:', res),
        error: (err) => console.error('Error creating warranty:', err)
      });
    }
  }

}
