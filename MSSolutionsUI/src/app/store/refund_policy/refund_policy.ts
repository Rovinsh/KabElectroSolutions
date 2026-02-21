    import { Component} from '@angular/core';
   import { CommonModule } from '@angular/common';
   import { RouterModule,Router } from '@angular/router';
   import { MatDialogModule } from '@angular/material/dialog';
   @Component({
  selector: 'app-refund-policy',
  standalone: true,
  imports: [CommonModule,RouterModule,MatDialogModule],   // ✅ REQUIRED
  templateUrl: './refundPolicy.html',
  styleUrls: ['./refund.css']
   })
   export class RefundPolicyComponent  {
   }