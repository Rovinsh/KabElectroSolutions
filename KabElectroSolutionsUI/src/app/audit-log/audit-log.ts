import { Component, Input } from '@angular/core';
import { DatePipe } from '@angular/common';

@Component({
  selector: 'app-audit-log',
  standalone: true,
  templateUrl: '../audit-log/audit-log.html',
  styleUrls: ['../audit-log/audit-log.css'],
  imports: [DatePipe]
})
export class AuditLogComponent {

  @Input() auditLogs: any[] = [];
}
