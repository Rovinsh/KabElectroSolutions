import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule,Router } from '@angular/router';
import { MatDialogModule } from '@angular/material/dialog';
@Component({
  selector: 'app-privacy-policy',
  standalone: true,
  imports: [CommonModule,RouterModule,MatDialogModule],   // ✅ REQUIRED
  templateUrl: './privacyPolicy.html',
  styleUrls: ['./privacy.css']
})
export class PrivacyPolicyComponent  {
}