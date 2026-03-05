    import { Component} from '@angular/core';
   import { CommonModule } from '@angular/common';
   import { RouterModule,Router } from '@angular/router';
   import { MatDialogModule } from '@angular/material/dialog';
   @Component({
  selector: 'app-aboutus',
  standalone: true,
  imports: [CommonModule,RouterModule,MatDialogModule],   // ✅ REQUIRED
  templateUrl: './aboutus.html',
  styleUrls: ['./aboutus.css']
   })
   export class AboutusComponent  {
   }