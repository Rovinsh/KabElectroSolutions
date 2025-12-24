// src/app/shared/session-expiry-snackbar.component.ts
import { Component, EventEmitter, Output, Input } from '@angular/core';
import { MatSnackBarRef } from '@angular/material/snack-bar';
import { interval, takeWhile } from 'rxjs';

@Component({
  selector: 'app-session-expiry-snackbar',
  standalone: true,
  template: `
    <div class="snackbar-container">
      <span>Your session will expire in {{ secondsLeft }}s.</span>
      <button mat-flat-button color="primary" (click)="continue()">Continue</button>
    </div>
  `,
  styles: [`
    .snackbar-container {
      display: flex;
      justify-content: space-between;
      align-items: center;
      width: 100%;
      gap: 12px;
    }
  `]
})
export class SessionExpirySnackbarComponent {
  @Input() secondsLeft = 60;
  @Output() continueSession = new EventEmitter<void>();

  constructor(public snackRef: MatSnackBarRef<SessionExpirySnackbarComponent>) {}

  ngOnInit() {
    interval(1000).pipe(takeWhile(() => this.secondsLeft > 0)).subscribe(() => {
      this.secondsLeft--;
      if (this.secondsLeft <= 0) this.snackRef.dismiss();
    });
  }

  continue() {
    this.continueSession.emit();
    this.snackRef.dismiss();
  }
}
