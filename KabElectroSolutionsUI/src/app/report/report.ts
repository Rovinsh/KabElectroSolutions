import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ApiService } from '../services/api.service';
import { MatSelectModule } from '@angular/material/select';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { MatNativeDateModule, provideNativeDateAdapter } from '@angular/material/core';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { AgGridModule } from 'ag-grid-angular';

@Component({
  selector: 'app-report',
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    MatDatepickerModule,
    MatNativeDateModule,
    AgGridModule,
    MatSelectModule,
    MatFormFieldModule,
    MatInputModule
  ],
  providers: [provideNativeDateAdapter()],
  templateUrl: './report.html',
  styleUrls: ['./report.css']
})
export class ReportComponent implements OnInit {
  reportTypes: string[] = ['Zopper Call Report', 'Open', 'Closed', 'Aborted'];
  selectedReportType = 'Zopper Call Report';
  selectedRange = { start: null as Date | null, end: null as Date | null };
  reports: any[] = [];

  constructor(private apiService: ApiService) {}

  ngOnInit(): void {
    this.loadReports();
     this.loadFilteredReports();
  }

  loadReports() {
    this.reports = [
      {
        fileName: 'crm_report_2024-11-04_2025-11-03.csv',
        dateRange: '2024-11-04 - 2025-11-03',
        link: '#',
        timeStamp: '11/04/2025 11:33:15',
        status: 'Uploaded'
      },
      {
        fileName: 'crm_report_2025-05-26_2025-11-02.csv',
        dateRange: '2025-05-26 - 2025-11-02',
        link: '#',
        timeStamp: '11/02/2025 21:58:22',
        status: 'Uploaded'
      }
    ];
  }

  reportCols = [
    { headerName: 'S.No.', valueGetter: 'node.rowIndex + 1', width: 100 },
    { headerName: 'File Name', field: 'fileName', flex: 2 },
    { headerName: 'Date Range', field: 'dateRange', flex: 2 },
    {
      headerName: 'Report Link',
      field: 'link',
      flex: 1.5,
      cellRenderer: (params: any) =>
        `<a href="${params.value}" target="_blank" class="text-decoration-none">Link</a>`
    },
    { headerName: 'Time Stamp', field: 'timeStamp', flex: 2 },
    {
      headerName: 'Status',
      field: 'status',
      flex: 1.5,
      cellRenderer: (params: any) => {
        const status = params.value;
        const badgeClass =
          status === 'Uploaded'
            ? 'bg-success text-white px-2 py-1 rounded'
            : 'bg-warning text-dark px-2 py-1 rounded';
        return `<span class="${badgeClass}">${status}</span>`;
      }
    }
  ];

  refreshReports() {
    this.loadFilteredReports();
  }

  downloadReport() {
    console.log('Download report clicked');
  }

  generateLink() {
    console.log('Generate link clicked');
  }

  resetFilters() {
    this.selectedRange = { start: null, end: null };
    this.selectedReportType = 'Zopper Call Report';
    this.loadFilteredReports();
  }

  onFiltersChanged() {
    if ((this.selectedRange.start || this.selectedRange.end) || this.selectedReportType) {
      this.loadFilteredReports();
    }
  }
onDateChanged() {
  if ((this.selectedRange.start || this.selectedRange.end) || this.selectedReportType) {
    this.loadFilteredReports();
  }
}

  loadFilteredReports() {
    this.apiService
      .getReports({
        reportType: this.selectedReportType,
        startDate: this.selectedRange.start!,
        endDate: this.selectedRange.end!
      })
      .subscribe((res) => {
        this.reports = res;
      });
  }
}
