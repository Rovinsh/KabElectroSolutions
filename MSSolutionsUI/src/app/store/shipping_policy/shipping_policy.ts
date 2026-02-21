
    import { Component} from '@angular/core';
     import { CommonModule } from '@angular/common';
     import { RouterModule,Router } from '@angular/router';
     import { MatDialogModule } from '@angular/material/dialog';
     @Component({
  selector: 'app-shipping',
  standalone: true,
  imports: [CommonModule,RouterModule,MatDialogModule],   // ✅ REQUIRED
  templateUrl: './shippingPolicy.html',
  styleUrls: ['./shipping.css']
     })
     export class ShippingPolicyComponent  {
     }