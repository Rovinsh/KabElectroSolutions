import { Component, inject, OnInit } from '@angular/core';
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
    public dialogRef: MatDialogRef<AppointmentComponent>
  ) {}

  private data = inject(MAT_DIALOG_DATA) as {claimId:number , appointmentDate: string, appointmentTime: string, pendingReason: string};
 claimId =  this.data.claimId;
// existingappointmentDate = this.data.appointmentDate;
// existingappointmentTime = this.data.appointmentTime;
// existingpendingReason = this.data.pendingReason;
  closeDialog() {
    this.dialogRef.close();
  }

 ngOnInit(): void {
this.appointmentDate = this.data.appointmentDate;
if(this.data.appointmentTime){
const dt = new Date(this.data.appointmentTime);
const hours = dt.getHours().toString().padStart(2, '0');
const minutes = dt.getMinutes().toString().padStart(2, '0');

this.appointmentTime = hours +":" + minutes;
}
this.pendingReason = this.data.pendingReason
 }

  submitAppointment() {
    const obj = {
      appointmentDate: this.appointmentDate,
      appointmentTime: this.appointmentTime,
      remarks: this.remarks,
      pendingReason: this.pendingReason,
      visitPendingReason: this.visitPendingReason
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
