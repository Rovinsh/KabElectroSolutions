import { Component } from '@angular/core';
import { ReactiveFormsModule, FormBuilder, FormGroup, Validators, FormControl } from '@angular/forms';
import { HttpClient } from '@angular/common/http';
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
import { ApiService } from '../services/api.service';
import {  ModuleRegistry, AllCommunityModule } from 'ag-grid-community';
import { ToastService } from '../services/toastService.service';
import { MatDialogRef } from '@angular/material/dialog';
ModuleRegistry.registerModules([AllCommunityModule]);

@Component({
  selector: 'app-category-form-component',
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
  templateUrl: './category-form.html',
  styleUrl: './category-form.css'
})
export class CategoryFormComponent {
categoryForm!: FormGroup;
constructor(private fb: FormBuilder, private http: HttpClient,private apiService: ApiService, private toast:ToastService, private dialogRef: MatDialogRef<CategoryFormComponent>) { }

ngOnInit(): void {
  this.categoryForm = this.fb.group({
  catName:['', Validators.required],
  description:[null],
  isDisable: [true] 
    });
  }

 onSubmit(): void {
  if (this.categoryForm.valid) {
    this.apiService.postCategory(this.categoryForm.value).subscribe({
      next: (res) => {
        console.log('Category created:', res);
        this.toast.success('Category Created Successfully!');
         this.dialogRef.close('success');
      },
      error: (err) => {
        console.error('Error creating category:', err);
        this.toast.error(err?.message || 'Error creating category!');
      }
    });
  }
}
onClose() {
    this.dialogRef.close(); 
  }
}
