import { Component, OnInit, ViewChild } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ApiService, ReportsDto, ReportFilterDto } from '../services/api.service';
import { MatSelectModule } from '@angular/material/select';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { MatNativeDateModule, provideNativeDateAdapter } from '@angular/material/core';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { AgGridModule } from 'ag-grid-angular';
import { ColDef } from 'ag-grid-community';
import { AgGridAngular } from "ag-grid-angular";
import { ChangeDetectorRef } from '@angular/core';
import * as XLSX from 'xlsx';
import { Claim } from '../models/claim.model';

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
  isSubmitting = false;
 claims: Claim[]=[];
 isLoading = false;
  reportTypes: string[] = ['Zopper Call Report', 'Open', 'Closed', 'Aborted'];
  selectedReportType = 'Zopper Call Report';

  selectedRange = {
    start: null as Date | null,
    end: null as Date | null
  };

  reports: ReportsDto[] = [];

  constructor(private apiService: ApiService, private cdr: ChangeDetectorRef) {}

  ngOnInit(): void {
     this.isLoading = true;
    this.loadReports();
  }

  reportCols: ColDef<ReportsDto>[] = [
    { headerName: 'Sno', width: 60, valueGetter: (params: any) => params.node.rowIndex + 1, cellClass: 'excelCell' },
    {
    headerName: 'Link',
    field: 'fileName',
    cellRenderer: (params: any) => {
      const file = params.value;
      if (!file) return '-';
      return `<a href="/Reports/${file}" target="_blank" download>
                ${file}
              </a>`;
    }
  },
    { headerName: 'File Name', field: 'fileName', cellClass: 'excelCell' },
    { headerName: 'Date Range', field: 'dateRange', cellClass: 'excelCell' },
    { headerName: 'Time Stamp', field: 'timeStamp', cellClass: 'excelCell' },
    {
      headerName: 'Status',
      field: 'status',
      cellClass: 'excelCell',
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

  onFiltersChanged() {
    if (this.canFilter()) { }
  }

  onDateChanged() {
    if (this.canFilter()) { }
  }

  canFilter() {
    return (
      !!this.selectedReportType &&
      !!this.selectedRange.start &&
      !!this.selectedRange.end
    );
  }

  refreshReports() {
    this.isLoading = true;
    this.loadReports();
  }
   downloadReport() {this.isSubmitting = true;
    if (!this.canFilter()) return;
     this.isLoading = true;
    this.loadFilteredReports("downloadReport");
  }

  generateLink() { this.isSubmitting = true;
    if (!this.canFilter()) return;
     this.isLoading = true;
    this.loadFilteredReports("generateLink");
  }

  resetFilters() {  this.isLoading = true;
    this.selectedRange = { start: null, end: null };
    this.selectedReportType = 'Zopper Call Report';
    this.loadReports();  
  }

  loadReports() {
    this.apiService.getReports().subscribe((res) => {
      this.reports = res.data;
       this.isLoading = false;
       this.isSubmitting = false;
    });
  }

 loadFilteredReports(reportName: string) {
    const payload: ReportFilterDto = {
      reportType: this.selectedReportType,
      startDate: this.selectedRange.start!,
      endDate: this.selectedRange.end!,
      reportName
    };
    this.apiService.postReport(payload).subscribe(res => {

      if (reportName === "downloadReport") {
        this.isLoading = false;this.isSubmitting = false;
        this.exportToExcel();
        return;
      }

      if (reportName === "generateLink") {
        this.loadReports();this.isSubmitting = false;
        this.isLoading = false;
      }
    });
  }


  exportToExcel() {
    if (!this.reports || this.reports.length === 0) return;
const worksheet = XLSX.utils.json_to_sheet(this.claims);
  const workbook = { Sheets: { 'crm_report_': worksheet }, SheetNames: ['crm_report_'] };
  const fileName =
    "crm_report_" +
      this.selectedRange.start!.toISOString().split("T")[0] +
      "_" +
      this.selectedRange.end!.toISOString().split("T")[0] +
      ".xlsx";
  XLSX.writeFile(workbook, fileName);
  }

}
