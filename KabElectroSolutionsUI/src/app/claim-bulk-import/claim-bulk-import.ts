import { Component } from '@angular/core';
import { HttpEventType } from '@angular/common/http';
import { ApiService } from '../services/api.service';
import { MatCardModule } from '@angular/material/card';
import { MatButtonModule } from '@angular/material/button';
import { MatProgressBarModule } from '@angular/material/progress-bar';
import { MatFormFieldModule } from '@angular/material/form-field';
import { CommonModule } from '@angular/common';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import * as XLSX from 'xlsx';
import { Subscription } from 'rxjs';
@Component({
  selector: 'app-claim-bulk-import',
  imports: [MatCardModule,MatButtonModule,MatProgressBarModule,MatFormFieldModule,CommonModule,MatProgressSpinnerModule],
  templateUrl: './claim-bulk-import.html',
  styleUrl: './claim-bulk-import.css'
})
export class ClaimBulkImport {selectedFile: File | null = null;
  progress = 0;
  uploading = false;
  dragging = false;

  error: string | null = null;
  result: any = null;

  private uploadSub?: Subscription;

  constructor(private service: ApiService) {}

  /* ---------- Drag & Drop ---------- */

  onDragOver(e: DragEvent) {
    e.preventDefault();
    this.dragging = true;
  }

  onDragLeave(e: DragEvent) {
    e.preventDefault();
    this.dragging = false;
  }

  onDrop(e: DragEvent) {
    e.preventDefault();
    this.dragging = false;

    const file = e.dataTransfer?.files?.[0];
    if (file) this.validateAndSetFile(file);
  }

  onFileSelect(event: Event) {
    const file = (event.target as HTMLInputElement).files?.[0];
    if (file) this.validateAndSetFile(file);
  }

  /* ---------- Client-side Excel Validation ---------- */

  validateAndSetFile(file: File) {
    const ext = file.name.split('.').pop()?.toLowerCase();
    if (!['csv', 'xls', 'xlsx'].includes(ext!)) {
      this.error = 'Only CSV / Excel files allowed';
      return;
    }

    const reader = new FileReader();
    reader.onload = e => {
      const data = new Uint8Array(e.target!.result as ArrayBuffer);
      const wb = XLSX.read(data, { type: 'array' });
      const sheet = wb.Sheets[wb.SheetNames[0]];
      const rows = XLSX.utils.sheet_to_json(sheet, { header: 1 });

      const headers = rows[0] as string[];
      const required = [
        'CustomerName',
        'CustomerPhone',
        'Concern',
        'ItemName',
        'InvoiceNumber'
      ];

      const missing = required.filter(h => !headers.includes(h));
      if (missing.length) {
        this.error = `Missing columns: ${missing.join(', ')}`;
        return;
      }

      this.selectedFile = file;
      this.error = null;
      this.result = null;
    };

    reader.readAsArrayBuffer(file);
  }

  /* ---------- Upload + Progress ---------- */

  upload() {
    if (!this.selectedFile) return;

    this.uploading = true;
    this.progress = 0;

    this.uploadSub = this.service.uploadClaims(this.selectedFile)
      .subscribe({
        next: event => {
          if (event.type === HttpEventType.UploadProgress && event.total) {
            this.progress = Math.round((event.loaded / event.total) * 100);
          }

          if (event.type === HttpEventType.Response) {
            this.result = event.body;
            this.uploading = false;
          }
        },
        error: () => {
          this.error = 'Upload failed';
          this.uploading = false;
        }
      });
  }

downloadTemplate() {
  const link = document.createElement('a');
  link.href = 'assets/Claims.xlsx';
  link.download = 'Claims.xlsx';
  link.click();
}

  cancelUpload() {
    this.uploadSub?.unsubscribe();
    this.uploading = false;
    this.progress = 0;
  }

  /* ---------- Download Failed Rows ---------- */

  downloadFailed() {
    this.service.downloadFailedRows(this.result.failedRows)
      .subscribe(blob => {
        const url = URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        a.download = 'FailedClaims.xlsx';
        a.click();
        URL.revokeObjectURL(url);
      });
  }
}
