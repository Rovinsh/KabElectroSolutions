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
 claims: Claim[]=[];
  reportTypes: string[] = ['Zopper Call Report', 'Open', 'Closed', 'Aborted'];
  selectedReportType = 'Zopper Call Report';

  selectedRange = {
    start: null as Date | null,
    end: null as Date | null
  };

  reports: ReportsDto[] = [];

  constructor(private apiService: ApiService, private cdr: ChangeDetectorRef) {}

  ngOnInit(): void {
    this.loadReports();
  }

  reportCols: ColDef<ReportsDto>[] = [
    { headerName: 'Sno', width: 60, valueGetter: (params: any) => params.node.rowIndex + 1, cellClass: 'excelCell' },
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

  private canFilter(): boolean {
    return !!this.selectedReportType &&
           !!this.selectedRange.start &&
           !!this.selectedRange.end;
  }

  refreshReports() {
    this.loadReports();
  }

  downloadReport() {
   if (this.canFilter()) {
      this.loadFilteredReports("downloadReport");
    }
  }

  generateLink() {
    if (this.canFilter()) {
      this.loadFilteredReports("generateLink");
    }
  }

  resetFilters() {
    this.selectedRange = { start: null, end: null };
    this.selectedReportType = 'Zopper Call Report';
    this.loadReports();  
  }

  loadReports() {
    this.apiService.getReports().subscribe((res) => {
      this.reports = res.data;
    });
  }

  loadFilteredReports(reportName:string) {
  const payload: ReportFilterDto = {
    reportType: this.selectedReportType,
    startDate: this.selectedRange.start!,
    endDate: this.selectedRange.end!,
    reportName:reportName
  };

  this.apiService.postReport(payload).subscribe((res) => {
    this.reports = res.report;
    this.claims = res.claims.results;
    this.cdr.detectChanges();
    setTimeout(() => {
      this.exportToExcel();
    }, 50);
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
    

  

    // // Add custom header rows
    // const headerRows = [
    //   ["CRM Report"],
    //   [`Report Type: ${this.selectedReportType}`],
    //   [
    //     `Date Range: ${this.selectedRange.start!.toISOString().split("T")[0]
    //     } to ${this.selectedRange.end!.toISOString().split("T")[0]}`
    //   ],
    //   []
    // ];

    // XLSX.utils.sheet_add_aoa(worksheet, headerRows, { origin: "A1" });

    // // Auto column width
    // const colWidths = Object.keys(this.reports[0]).map(col => ({ wch: 20 }));
    // worksheet["!cols"] = colWidths;

    // // Create workbook
    // const wb = XLSX.utils.book_new();
    // XLSX.utils.book_append_sheet(wb, worksheet, "Report");

    // // Convert to Excel buffer
    // const excelBuffer = XLSX.write(wb, { bookType: "xlsx", type: "array" });

    // // Save file
    // const blob = new Blob([excelBuffer], {
    //   type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
    // });

    // saveAs(blob, fileName);
  }

}
