import { Component, ViewChildren, QueryList, ElementRef, inject, CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { FormArray, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatSelectModule } from '@angular/material/select';
import { MatIconModule } from '@angular/material/icon';
import { MatButtonModule } from '@angular/material/button';
import { MatRadioModule } from '@angular/material/radio';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule } from '@angular/forms';
import { MatDialogModule, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { ApiService, ShareEstimationDto } from '../services/api.service';

@Component({
  selector: 'app-share-estimation',
  templateUrl: './share-estimation.html',
  styleUrls: ['./share-estimation.css'],
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
export class ShareEstimationComponent {

  @ViewChildren("fileInputs") fileInputs!: QueryList<ElementRef<HTMLInputElement>>;

  materialList = ['PCB Replace', 'Service Valv', 'Motor', 'Wiring', 'Compressor'];
  shareForm!: FormGroup;

  private apiService = inject(ApiService);
  private data = inject(MAT_DIALOG_DATA) as { claimId: number };
  claimId = this.data.claimId;

  constructor(
    private fb: FormBuilder,
    public dialogRef: MatDialogRef<ShareEstimationComponent>
  ) {
    this.shareForm = this.fb.group({
      items: this.fb.array([]),
      observation: ['', Validators.required],
      claimType: ['', Validators.required],
      symptom: ['', Validators.required],
      remarks: [''],
      imagesArray: this.fb.array([])
    });

    this.addRow();
  }

  ngOnInit() {
    this.addImage("Upload image");
    this.addImage("Upload image", true);
    this.addImage("Upload image", true);
  }

  get items(): FormArray { return this.shareForm.get('items') as FormArray; }
  get imagesArray(): FormArray { return this.shareForm.get('imagesArray') as FormArray; }

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

  addRow() {
    this.items.push(
      this.fb.group({
        type: ['Services', Validators.required],
        material: ['PCB Replace', Validators.required],
        hsn: ['', Validators.required],
        price: [0, [Validators.required, Validators.min(1)]],
        tax: [18, Validators.required],
        removable: [this.items.length > 0]
      })
    );
  }

  removeRow(i: number) {
    if (this.items.at(i).get('removable')?.value) this.items.removeAt(i);
  }

  isLastRowValid(): boolean {
    return this.items.length > 0 && this.items.at(this.items.length - 1).valid;
  }

  getTaxAmount(i: number): number {
    const item = this.items.at(i).value;
    return (item.price * item.tax) / 100;
  }

  getTotal(i: number): number {
    const item = this.items.at(i).value;
    return item.price + this.getTaxAmount(i);
  }

  getGrandTotal(): number {
    return this.items.controls.map((_, i) => this.getTotal(i)).reduce((a, b) => a + b, 0);
  }

//   shareEstimate() {
//   if (this.shareForm.invalid) {
//     this.shareForm.markAllAsTouched();
//     return;
//   }

//   const dto: ShareEstimationDto = {
//     claimId: this.claimId,
//     observation: this.shareForm.value.observation,
//     claimType: this.shareForm.value.claimType,
//     symptom: this.shareForm.value.symptom,
//     remarks: this.shareForm.value.remarks,
//     items: this.items.value.map((item: any) => ({
//       type: item.type,
//       material: item.material,
//       hsn: item.hsn,
//       price: item.price,
//       tax: item.tax
//     })),
//     files: this.imagesArray.controls
//       .map(ctrl => ctrl.value.file)
//       .filter(file => file) 
//   };

//   const formData = new FormData();
//   formData.append("data", JSON.stringify(dto));
//   dto.files?.forEach(file => formData.append("files", file));

//   this.apiService.updateShareEstimation(formData).subscribe({
//     next: res => this.dialogRef.close({ success: true, data: res }),
//     error: err => console.error(err)
//   });
// }

shareEstimate() {
  if (this.shareForm.invalid) {
    this.shareForm.markAllAsTouched();
    return;
  }

  const formData = new FormData();

  // Append primitive fields
  formData.append('ClaimId', this.claimId.toString());
  formData.append('Observation', this.shareForm.value.observation);
  formData.append('ClaimType', this.shareForm.value.claimType);
  formData.append('Symptom', this.shareForm.value.symptom);
  formData.append('Remarks', this.shareForm.value.remarks || '');

  // Append items individually so ASP.NET Core model binder can map to List<EstimationItem>
  this.items.controls.forEach((item, index) => {
    formData.append(`Items[${index}].Type`, item.value.type);
    formData.append(`Items[${index}].Material`, item.value.material);
    formData.append(`Items[${index}].HSNCode`, item.value.hsn.toString());
    formData.append(`Items[${index}].Price`, item.value.price.toString());
    formData.append(`Items[${index}].TaxPercent`, item.value.tax.toString());
  });

  // Append images
  this.imagesArray.controls.forEach(ctrl => {
    if (ctrl.value.file) {
      formData.append('Images', ctrl.value);
    }
  });

  console.log('FormData ready', formData);

  // Call API
  this.apiService.updateShareEstimation(formData).subscribe({
    next: res => {
      console.log('Upload success', res);
      this.dialogRef.close({ success: true, data: res });
    },
    error: err => {
      console.error('Upload failed', err);
    }
  });
}

  onClose() { this.dialogRef.close(); }

}
