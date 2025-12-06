import { Component, inject } from '@angular/core';
import { FormArray, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatSelectModule } from '@angular/material/select';
import { MatIconModule } from '@angular/material/icon';
import { MatButtonModule } from '@angular/material/button';
import { MatRadioModule } from '@angular/material/radio';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule } from '@angular/forms';
import { MAT_DIALOG_DATA,MatDialogRef } from '@angular/material/dialog';
import { MatDialogModule } from '@angular/material/dialog';

@Component({
  selector: 'app-share-estimation',
  templateUrl: './share-estimation.html',
  styleUrls: ['./share-estimation.css'],
  imports: [MatFormFieldModule,
    MatInputModule,
    MatSelectModule,
    MatIconModule,
    MatButtonModule,
    MatRadioModule,CommonModule,ReactiveFormsModule,MatDialogModule]
})
export class ShareEstimationComponent {

  materialList = ['PCB Replace', 'Service Valv', 'Motor', 'Wiring', 'Compressor'];
  shareForm!: FormGroup;
  private data = inject(MAT_DIALOG_DATA) as {claimId:number };
  claimId =  this.data.claimId;
  imagesArray!: FormArray;
  
  constructor(private fb: FormBuilder, public dialogRef: MatDialogRef<ShareEstimationComponent>) {
     this.shareForm = this.fb.group({
      items: this.fb.array([]),
      observation: ['', Validators.required],
      claimType: ['', Validators.required],
      symptom: ['', Validators.required],
      remarks: ['']
    });

    // Demo: Add 2 rows initially
    this.addRow();
    //this.addRow();
  }

ngOnInit(): void {
  this.imagesArray = this.fb.array([]);
  // Ensure at least 1 row
  if (this.imagesArray.length === 0) {
    this.addImage();
    this.addImage();
    this.addImage();
  }
}

get imagesArrayControls() {
  return this.imagesArray.controls;
}

addImage() {
  this.imagesArray.push(this.fb.control(null));
}

removeImage(index: number) {
  if (this.imagesArray.length > 1) {
    this.imagesArray.removeAt(index);
  }
}

onSelectImage(index: number) {
  // Your file picker code
}

shareEstimate() {
  console.log("Sharing estimate...");
}

  get items(): FormArray {
    return this.shareForm.get('items') as FormArray;
  }

   closeDialog() {
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
      removable: [this.items.length > 0] // first row = not removable
    })
  );
}

onClose() {
    this.dialogRef.close(); // closes ONLY when clicking the close icon
  }

isLastRowValid(): boolean {
  if (this.items.length === 0) return false;
  return this.items.at(this.items.length - 1).valid;
}

removeRow(i: number) {
  const row = this.items.at(i).get('removable')?.value;

  if (!row) {
    return; // 👈 first row can't be deleted
  }

  this.items.removeAt(i);
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
