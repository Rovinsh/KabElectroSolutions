import { Component } from '@angular/core';
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
import { ApiService, CategoryDto } from '../services/api.service';

@Component({
 selector: 'app-plan-form',
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
  templateUrl: './plan-form.html',
  styleUrl: './plan-form.css'
})
export class PlanFormComponent {
planForm!: FormGroup;
categories:CategoryDto[]=[];
filteredcategories$!: Observable<CategoryDto[]>;
constructor(private fb: FormBuilder, private http: HttpClient,private apiService: ApiService) { }

ngOnInit(): void {

    this.apiService.getCategories().subscribe(res => {
      this.categories = res.data;
    });

  this.planForm = this.fb.group({
  catId: [null, Validators.required],    
  planName: ['', Validators.required],
  description : [''],  
  remark : [''],                     
  isDisable: [true]   
    });
  }

 showAllCategoriesTypes() {
  this.filteredcategories$ = of(this.categories );
  }

  // private _filterCategories(value: string): CategoryDto[] {
  //   const filterValue = value.toLowerCase();
  //   return this.categories.filter(category =>
  //     category.CatName.toLowerCase().includes(filterValue)
  //   );
  // }
onSubmit(): void {
  if (this.planForm.valid) {
    this.apiService.postPlans(this.planForm.value).subscribe({
      next: (res) => console.log('plan created:', res),
      error: (err) => console.error('Error creating plan:', err)
    });
  }
}
}
