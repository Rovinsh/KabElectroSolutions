 import { Component} from '@angular/core';
  import { CommonModule } from '@angular/common';
  import { RouterModule,Router } from '@angular/router';
  import { MatDialogModule } from '@angular/material/dialog';
  @Component({
    selector: 'app-term-policy',
  standalone: true,
  imports: [CommonModule,RouterModule,MatDialogModule],   // ✅ REQUIRED
  templateUrl: './term_condition.html',
  styleUrls: ['./term.css']
  })
  export class TermConditionComponent  {
  }