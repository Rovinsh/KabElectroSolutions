import { Component, ViewChildren, QueryList, ElementRef, inject, CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { FormArray, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatSelectModule } from '@angular/material/select';
import { MatIconModule } from '@angular/material/icon';
import { MatButtonModule } from '@angular/material/button';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule } from '@angular/forms';
import { MatDialogModule, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { ApiService, ShareEstimationDto } from '../services/api.service';
import { ToastService } from '../services/toastService.service';

@Component({
  selector: 'app-product-imges',
  templateUrl: './product-imges.html',
  styleUrls: ['./product-imges.css'],
  imports: [
    MatFormFieldModule,
    MatInputModule,
    MatSelectModule,
    MatIconModule,
    MatButtonModule,
    MatRadioModule,
    CommonModule,
    ReactiveFormsModule,
    MatDialogModule
  ],
  schemas: [CUSTOM_ELEMENTS_SCHEMA]  
})
export class ProductImagesComponent {

  @ViewChildren("fileInputs") fileInputs!: QueryList<ElementRef<HTMLInputElement>>;
  productImagesForm!: FormGroup;
  isSubmitting = false;
  private apiService = inject(ApiService);
   private toast = inject(ToastService);
  private data = inject(MAT_DIALOG_DATA) as { claimId: number };
  claimId = this.data.claimId;
  isLoading = false;

  constructor(
    private fb: FormBuilder,
    public dialogRef: MatDialogRef<ProductImagesComponent>
  ) {
    this.shareForm = this.fb.group({
      imagesArray: this.fb.array([])
    });
  }

  ngOnInit() {
    this.addImage("Upload image", true);
    this.addImage("Upload image", true);
    this.addImage("Upload image", true);
  }
get imagesArray(): FormArray { return this.productImagesForm.get('imagesArray') as FormArray; }

  addImage(label: string, required = false) {
    this.imagesArray.push(this.fb.group({
      label,
      required,
      file: null,
      fileName: '',
      previewUrl: ''
    }));
  }

  triggerFile(index: number) {
    const inputList = this.fileInputs.toArray();
    inputList[index]?.nativeElement.click();
  }

  onSelectImage(event: any, index: number) {
    const file = event.target.files[0];
    if (!file) return;

    const reader = new FileReader();
    reader.onload = () => {
      this.imagesArray.at(index).patchValue({
        file,
        fileName: file.name,
        previewUrl: reader.result
      });
    };
    reader.readAsDataURL(file);
  }

productImages() {
  if (this.productImagesForm.invalid) {
    this.productImagesForm.markAllAsTouched();
    return;
  }

  const formData = new FormData();
this.imagesArray.controls.forEach(ctrl => {
  if (ctrl.value.file) {
    formData.append('Images', ctrl.value.file, ctrl.value.file.name);
  }
});

  this.isSubmitting = true;
  this.isLoading = true;
  this.apiService.updateProductImages(formData).subscribe({
    next: res => {
      this.toast.success('Product Images add successfully.!');
      this.dialogRef.close('success');
      this.isSubmitting = false;
      this.isLoading = false;
    },
    error: err => {  this.toast.error('Something went wrong!');
     this.isSubmitting = false;
     this.isLoading = false;
    }
  });
}
 onClose() { this.dialogRef.close(); }

}
