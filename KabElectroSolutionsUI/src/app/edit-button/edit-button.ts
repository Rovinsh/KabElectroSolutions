import { Component, Input, Output, EventEmitter } from '@angular/core';

@Component({
  selector: 'app-edit-button',
   imports: [],
  template: `
    <button class="btn btn-sm btn-primary" (click)="onClick()" title="Edit">
      ✏️
    </button>
  `
})
export class EditButtonComponent {
  @Input() rowData!: any;     
  @Output() edit = new EventEmitter<any>();

  onClick() {
    this.edit.emit(this.rowData);
  }
}
