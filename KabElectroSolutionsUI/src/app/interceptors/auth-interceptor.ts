import { inject } from '@angular/core';
import {
  HttpInterceptorFn,
  HttpRequest,
  HttpHandlerFn,
  HttpEvent,
  HttpErrorResponse,
} from '@angular/common/http';
import { Observable, catchError, throwError } from 'rxjs';
import { Router } from '@angular/router';
import { AuthService } from '../services/auth';
import { MatSnackBar } from '@angular/material/snack-bar';
import { jwtDecode } from 'jwt-decode';

export const authInterceptor: HttpInterceptorFn = (
  req: HttpRequest<unknown>,
  next: HttpHandlerFn
): Observable<HttpEvent<unknown>> => {
  const authService = inject(AuthService);
  const router = inject(Router);
  const snackBar = inject(MatSnackBar);

  const token = authService.getToken();

  let authReq = req;
  if (token) {
    if (isTokenExpired(token)) {
      handleExpiredToken(authService, router, snackBar);
      return throwError(() => new Error('Token expired'));
    }
    authReq = req.clone({
      setHeaders: { Authorization: `Bearer ${token}` },
    });
  }

  return next(authReq).pipe(
    catchError((error: HttpErrorResponse) => {
      if (error.status === 401) {
        handleExpiredToken(authService, router, snackBar);
      }
      return throwError(() => error);
    })
  );
};

// Token-expiry helper
function isTokenExpired(token: string): boolean {
  try {
    const decoded: any = jwtDecode(token);
    if (!decoded.exp) return false;
    return Date.now() > decoded.exp * 1000;
  } catch {
    return true;
  }
}

// Common logout + snackbar + redirect logic
function handleExpiredToken(
  authService: AuthService,
  router: Router,
  snackBar: MatSnackBar
) {
  authService.logout();

  snackBar.open('Session expired, please log in again.', 'Close', {
    duration: 4000,
    horizontalPosition: 'center',
    verticalPosition: 'top',
    panelClass: ['snackbar-error'], // optional custom style
  });

  router.navigate(['/login']);
}
