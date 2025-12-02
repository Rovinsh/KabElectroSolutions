import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators,ReactiveFormsModule,FormArray, FormControl } from '@angular/forms';
import { MatDialogRef,MatDialogModule } from '@angular/material/dialog';
import { MatIconModule } from '@angular/material/icon';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-customer-visit',
  standalone: true,
  imports: [ReactiveFormsModule,MatDialogModule,MatIconModule,MatFormFieldModule,MatInputModule,CommonModule],
  templateUrl: './customer-visit.html',
  styleUrls: ['./customer-visit.css']
})
export class CustomerVisitComponent implements OnInit {
  visitForm!: FormGroup;
  previewUrls: { [key: string]: string | null } = {};
  othersPreviewUrls: string[] = [];
 previewTypes: any = {};

  constructor(
    private fb: FormBuilder,
    public dialogRef: MatDialogRef<CustomerVisitComponent> // For closing the dialog
  ) {}

  ngOnInit(): void {
    this.visitForm = this.fb.group({
      estimationImage: [null],
      productSerialNumber: [null, Validators.required],
      productImage: [null, Validators.required],
      productDefectImage: [null, Validators.required],
       othersImages: this.fb.array([this.createOthersUploadControl()]),
      remarks: ['']
    });
  }

  get othersImagesArray(): FormArray<FormControl<File | null>> {
  return this.visitForm.get('othersImages') as FormArray<FormControl<File | null>>;
}

  // Method to create a new FormControl for a file upload
  createOthersUploadControl(): FormControl {
    // We use a simple FormControl initialized to null for the file object
    return this.fb.control(null);
  }

onFileSelected(event: any, controlName: string | number, isArray: boolean = false): void {
  const file: File = event.target.files[0];
  if (!file) return;

  const reader = new FileReader();

  reader.onload = () => {
    if (isArray) {
      // Save file object in form
      this.othersImagesArray.at(controlName as number).setValue(file);

      // Save preview URL for dynamic others
      this.othersPreviewUrls[controlName as number] = reader.result as string;
    } else {
      // Save file in form
      this.visitForm.get(controlName as string)?.setValue(file);

      // Save preview URL
      this.previewUrls[controlName as string] = reader.result as string;
    }
  };

  reader.readAsDataURL(file);
}

removeOthersUpload(index: number): void {
  this.othersImagesArray.removeAt(index);
  this.othersPreviewUrls.splice(index, 1);
}


  // Method to handle file selection
  // onFileSelected(event: any, controlName: string): void {
  //   const file: File = event.target.files[0];
  //   if (file) {
  //     this.visitForm.get(controlName)?.setValue(file);
  //     // Optional: Set a flag to show the file name
  //   }
  // }

 addOthersUpload(): void {
  this.othersImagesArray.push(this.createOthersUploadControl());
}

  onSubmit(): void {
    // The submission logic remains similar, FormArray data will be included
    if (this.visitForm.valid) {
      // ... Submission logic ...
      console.log('Form Data Ready for Submission:', this.visitForm.value);
      this.dialogRef.close(true);
    } else {
      this.visitForm.markAllAsTouched();
    }
  }
}