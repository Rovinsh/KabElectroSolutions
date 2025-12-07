import { Component, OnInit,inject } from '@angular/core';
import { FormBuilder, FormGroup, Validators,ReactiveFormsModule,FormArray, FormControl } from '@angular/forms';
import { MatDialogRef,MatDialogModule,MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MatIconModule } from '@angular/material/icon';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { CommonModule } from '@angular/common';
import { ApiService } from '../services/api.service';
import { AuthService } from '../services/auth';

@Component({
  selector: 'app-customer-visit',
  standalone: true,
  imports: [ReactiveFormsModule,MatDialogModule,MatIconModule,MatFormFieldModule,MatInputModule,CommonModule],
  templateUrl: './customer-visit.html',
  styleUrls: ['./customer-visit.css']
})
export class CustomerVisitComponent {
  visitForm!: FormGroup;
  previewUrls: any = {};
  othersPreviewUrls: string[] = [];

  files: any = {
    estimationImage: null,
    productSerialNumber: null,
    productImage: null,
    productDefectImage: null,
    othersImages: []
  };

  constructor(
    private fb: FormBuilder,
    private api: ApiService,
    public dialogRef: MatDialogRef<CustomerVisitComponent> ,   
    private auth: AuthService
  ) {
    this.visitForm = this.fb.group({
      estimationImage: [null],
      productSerialNumber: [null, Validators.required],
      productImage: [null, Validators.required],
      productDefectImage: [null, Validators.required],
      remarks: [null],
      othersImages: this.fb.array([this.fb.control('')])
    });
  }

  private data = inject(MAT_DIALOG_DATA) as {claimId:number };
  claimId =  this.data.claimId;

  get othersImagesArray(): FormArray {
    return this.visitForm.get('othersImages') as FormArray;
  }

  addOthersUpload() {
    this.othersImagesArray.push(this.fb.control(''));
    this.files.othersImages.push(null);
  }

  removeOthersUpload(index: number) {
    this.othersImagesArray.removeAt(index);
    this.files.othersImages.splice(index, 1);
    this.othersPreviewUrls.splice(index, 1);
  }

  // MAIN FILE SELECTOR
  onFileSelected(event: any, field: any, isOthers: boolean = false) {
    const file = event.target.files[0];
    if (!file) return;

    const reader = new FileReader();
    reader.onload = () => {
      if (isOthers) {
        this.othersPreviewUrls[field] = reader.result as string;
        this.files.othersImages[field] = file;
      } else {
        this.previewUrls[field] = reader.result as string;
        this.files[field] = file;
      }
    };

    reader.readAsDataURL(file);
  }

  onSubmit() {
  const formData = new FormData();

  formData.append("ClaimId", this.claimId.toString());
  formData.append("Remarks", this.visitForm.value.remarks || "");
  formData.append("CreatedBy", "Test");

  // Add single images
  if (this.files.estimationImage)
    formData.append("EstimationImage", this.files.estimationImage);

  if (this.files.productSerialNumber)
    formData.append("ProductSerialNumber", this.files.productSerialNumber);

  if (this.files.productImage)
    formData.append("ProductImage", this.files.productImage);

  if (this.files.productDefectImage)
    formData.append("ProductDefectImage", this.files.productDefectImage);

  // Add multiple othersImages
  this.files.othersImages.forEach((file: File) => {
    formData.append("OthersImages", file);
  });

  this.api.uploadClaimImages(formData).subscribe({
    next: (res) => {
      console.log("Uploaded Successfully", res);
      this.dialogRef.close("Uploaded");
    },
    error: (err) => {
      console.error("Upload failed", err);
    }
  });
}
}
