import { Component, OnInit, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatDialogRef, MAT_DIALOG_DATA, MatDialogModule } from '@angular/material/dialog';
import { MatTableModule } from '@angular/material/table';
import { MatRadioModule } from '@angular/material/radio';
import { MatButtonModule } from '@angular/material/button';
import { WarrantyDto } from '../services/api.service';

@Component({
  selector: 'app-warranty-popup',
  standalone: true,
  imports: [
    CommonModule,
    MatDialogModule,
    MatTableModule,
    MatRadioModule,
    MatButtonModule
  ],
  templateUrl: './warranty-popup.html',
  styleUrls: ['./warranty-popup.css']
})
export class WarrantyPopupComponent implements OnInit {
  dataSource: WarrantyDto[] = [];

  displayedColumns: string[] = [
    'select',
    'warrantyName',
    'serialNumber',
    'warrantyType',
    'warrantyCode',
    'productName',
    'warrantyPurchaseDate',
    'warrantyStartDate',
    'catgoryName',
    'brandName'
  ];

  private dialogRef = inject(MatDialogRef<WarrantyPopupComponent>);
  private dialogData = inject(MAT_DIALOG_DATA) as {
  record?: WarrantyDto[];
};


  selectedId: number | null = null;

ngOnInit(): void {
  this.dataSource = this.dialogData?.record || [];
  this.dataSource = this.dataSource.map((r: any) => ({
    ...r,
    warrantyPurchaseDate: r.warrantyPurchaseDate ? new Date(r.warrantyPurchaseDate) : null,
    warrantyStartDate: r.warrantyStartDate ? new Date(r.warrantyStartDate) : null
  }));

  console.log('Popup Data Source:', this.dataSource);
}

  onSelect(row: WarrantyDto) {
    this.selectedId = row.id;
    this.dialogRef.close(row); 
  }

  onCancel() {
    this.dialogRef.close();
  }
}
