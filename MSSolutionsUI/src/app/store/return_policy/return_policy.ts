
   import { Component} from '@angular/core';
    import { CommonModule } from '@angular/common';
    import { RouterModule,Router } from '@angular/router';
    import { MatDialogModule } from '@angular/material/dialog';
    @Component({
   selector: 'app-return-policy',
   standalone: true,
   imports: [CommonModule,RouterModule,MatDialogModule],   // ✅ REQUIRED
   templateUrl: './returnPolicy.html',
   styleUrls: ['./return.css']
    })
    export class ReturnPolicyComponent  {
    }