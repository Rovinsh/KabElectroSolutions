import { Component, Inject } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { FormsModule } from '@angular/forms';
import { MatDialogModule } from '@angular/material/dialog';
import { MatIconModule } from '@angular/material/icon';
import { MatButtonModule } from '@angular/material/button';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-appointment',
  templateUrl: './appointment.html',
  styleUrls: ['./appointment.css'],
  imports: [FormsModule,MatButtonModule,MatIconModule,MatDialogModule,CommonModule]
})
export class AppointmentComponent {

  appointmentDate: string = '';
  appointmentTime: string = '';
  remarks: string = '';
  pendingReason: string = '';
  visitPendingReason: string = '';
  visitReasons: string[] = [];

  customerNotReachableReasons = [
  "Concern person not at home",
  "Customer number going busy",
  "Customer number switched off",
  "Customer out of station"
];

serviceCenterDependencyReasons = [
  "Technician not available",
  "Service center issue",
];

upcountryAreaReasons = [
  "Out of area call",
  "PJP Call, more than 30kms from city"
];


  constructor(
    public dialogRef: MatDialogRef<AppointmentComponent>,
    @Inject(MAT_DIALOG_DATA) public data: any
  ) {}

  closeDialog() {
    this.dialogRef.close();
  }

  submitAppointment() {
    const obj = {
      date: this.appointmentDate,
      time: this.appointmentTime,
      remarks: this.remarks,
      pendingReason: this.pendingReason,
      reason: this.visitPendingReason
    };

    this.dialogRef.close(obj);
  }

isFormValid(): boolean {
  return (
    this.appointmentDate &&
    this.appointmentTime &&
    this.remarks 
  )? true : false;;
}


  onPendingReasonChange() {
  if (this.pendingReason === "Customer not reachable") {
    this.visitReasons = this.customerNotReachableReasons;
  } else if (this.pendingReason === "Service Center Dependency") {
    this.visitReasons = this.serviceCenterDependencyReasons;
  } else if (this.pendingReason === "Upcountry Area") {
    this.visitReasons = this.upcountryAreaReasons;
  }

  this.visitPendingReason = "";  // reset dropdown
}
}
