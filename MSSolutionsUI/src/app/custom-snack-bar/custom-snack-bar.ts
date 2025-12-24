import { Component } from '@angular/core';
import { ToastService } from '../services/toastService.service';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-toast-container',
  standalone: true,
  imports: [CommonModule],
  template: `
   
  `,
  styles: [`
    .toast-wrapper {
      position: fixed;
      top: 16px;
      right: 16px;
      display: flex;
      flex-direction: column;
      gap: 10px;
      z-index: 9999;
    }
    .toast {
      display: flex;
      align-items: center;
      padding: 12px 16px;
      border-radius: 8px;
      min-width: 250px;
      color: #fff;
      font-weight: 500;
      box-shadow: 0 2px 8px rgba(0,0,0,0.2);
    }
    .toast.success { background-color: #007fff; }
    .toast.error { background-color: #f44336; }
    .toast.warning { background-color: #ff9800; }
    .toast.info { background-color: #2196f3; }

    .toast-icon { margin-right: 8px; }
    .toast-message { flex: 1; }
    .toast-close { background: transparent; border: none; color: inherit; cursor: pointer; margin-left: 8px; }
  `]
})
export class CustomSnackBarComponent {
  }

