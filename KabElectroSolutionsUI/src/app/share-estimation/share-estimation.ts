import { Component, ViewChildren, QueryList, ElementRef, inject } from '@angular/core';
import { FormArray, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatSelectModule } from '@angular/material/select';
import { MatIconModule } from '@angular/material/icon';
import { MatButtonModule } from '@angular/material/button';
import { MatRadioModule } from '@angular/material/radio';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule } from '@angular/forms';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { MatDialogModule } from '@angular/material/dialog';

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
  ]
})
export class ShareEstimationComponent {

 @ViewChildren("fileInputs") fileInputs!: QueryList<ElementRef<HTMLInputElement>>;

  materialList = ['PCB Replace', 'Service Valv', 'Motor', 'Wiring', 'Compressor'];
  shareForm!: FormGroup;

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
      imagesArray: this.fb.array([])            // ✅ FIXED: images inside FormGroup
    });

    this.addRow();
  }


  ngOnInit() {
  this.addImage("Upload image");
  this.addImage("Upload image", true);
  this.addImage("Upload image", true);
}
triggerFile(index: number) {
  const inputList = this.fileInputs.toArray();
  if (inputList[index]) {
    inputList[index].nativeElement.click();
  } else {
    console.warn("File input not found for index", index);
  }
}
  /** GETTERS **/
  get items(): FormArray {
    return this.shareForm.get('items') as FormArray;
  }

  get imagesArray(): FormArray {
    return this.shareForm.get('imagesArray') as FormArray;
  }

  get imagesArrayControls() {
    return this.imagesArray.controls;
  }

  /** IMAGE METHODS **/

  addImage(label: string, required = false) {
  this.imagesArray.push(
    this.fb.group({
      label,
      required,
      file: null,
      fileName: '',
      previewUrl: ''
    })
  );
}

  removeImage(i: number) {
    if (this.imagesArray.length > 1) {
      this.imagesArray.removeAt(i);
    }
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

  /** SUBMIT SHARE ESTIMATE **/

  shareEstimate() {
    const formData = new FormData();

    formData.append("claimId", this.claimId.toString());
    formData.append("observation", this.shareForm.value.observation);
    formData.append("claimType", this.shareForm.value.claimType);
    formData.append("symptom", this.shareForm.value.symptom);
    formData.append("remarks", this.shareForm.value.remarks);

    // Add Items
    formData.append("items", JSON.stringify(this.shareForm.value.items));

    // Add Images
    this.imagesArray.controls.forEach((ctrl, index) => {
      if (ctrl.value.file) {
        formData.append("files", ctrl.value.file);
      }
    });

    console.log("Final FormData ready to upload");
  }

  /** UI METHODS **/
  onClose() {
    this.dialogRef.close();
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
    if (this.items.at(i).get('removable')?.value) {
      this.items.removeAt(i);
    }
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
    return this.items.controls
      .map((_, i) => this.getTotal(i))
      .reduce((a, b) => a + b, 0);
  }
}
