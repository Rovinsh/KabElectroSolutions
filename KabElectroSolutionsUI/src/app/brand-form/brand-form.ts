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
  selector: 'app-brand-form',
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
  templateUrl: './brand-form.html',
  styleUrl: './brand-form.css'
})
export class BrandFormComponent {
brandForm!: FormGroup;
categories:CategoryDto[]=[];
filteredcategories$!: Observable<CategoryDto[]>;
constructor(private fb: FormBuilder, private http: HttpClient,private apiService: ApiService) { }

ngOnInit(): void {

    this.apiService.getCategories().subscribe(res => {
      this.categories = res.data;
    });

  this.brandForm = this.fb.group({
  CategoryId: [null, Validators.required],    
  BrandName: ['', Validators.required],       
  description: [null],                    
  IsDisable: [true]   
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
  if (this.brandForm.valid) {
    this.apiService.postBarands(this.brandForm.value).subscribe({
      next: (res) => console.log('brand created:', res),
      error: (err) => console.error('Error creating brand:', err)
    });
  }
}
}
