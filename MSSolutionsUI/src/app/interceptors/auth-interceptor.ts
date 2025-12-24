// src/app/interceptors/auth.interceptor.ts
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
import { MatSnackBar } from '@angular/material/snack-bar';
import { jwtDecode } from 'jwt-decode';
import { AuthService } from '../services/auth';
import { SessionExpirySnackbarComponent } from '../shared/session-expiry-snackbar/session-expiry-snackbar';

let countdownActive = false;

export const authInterceptor: HttpInterceptorFn = (
  req: HttpRequest<unknown>,
  next: HttpHandlerFn
): Observable<HttpEvent<unknown>> => {
  const authService = inject(AuthService);
  const router = inject(Router);
  const snackBar = inject(MatSnackBar);

  const token = authService.getToken();
  if (!token) return next(req);

  const expiryTime = getTokenExpiry(token);
  const now = Date.now();

  // ⏰ Token expiring soon (within 60s)
  if (expiryTime && expiryTime - now < 60_000 && expiryTime > now && !countdownActive) {
    countdownActive = true;

    const secondsLeft = Math.floor((expiryTime - now) / 1000);

    const ref = snackBar.openFromComponent(SessionExpirySnackbarComponent, {
      data: { secondsLeft },
      horizontalPosition: 'center',
      verticalPosition: 'top',
      duration: 60000,
      panelClass: ['session-expiry-snackbar'],
    });

    // ✅ If user clicks Continue — refresh token
    ref.instance.continueSession.subscribe(() => {
      authService.login({username: authService.username, password: authService.password}).subscribe({
        next: (res:any) => {
          authService.saveToken(res.token);
          snackBar.open('Session extended successfully!', 'Close', {
            duration: 3000,
            horizontalPosition: 'center',
            verticalPosition: 'top',
          });
          countdownActive = false;
        },
        error: () => {
          handleExpiredToken(authService, router, snackBar, false);
          countdownActive = false;
        },
      });
    });

    // 🚫 If user does NOT click — auto logout + navigate silently
    setTimeout(() => {
      if (ref.instance.secondsLeft <= 0) {
        handleExpiredToken(authService, router, snackBar, true); // silent = true
        countdownActive = false;
      }
    }, expiryTime - now);
  }

  // 🔒 Token already expired
  if (expiryTime && expiryTime <= now) {
    handleExpiredToken(authService, router, snackBar, false);
    return throwError(() => new Error('Token expired'));
  }

  // 🔐 Attach Authorization header
  const authReq = req.clone({
    setHeaders: { Authorization: `Bearer ${token}` },
  });

  return next(authReq).pipe(
    catchError((err: HttpErrorResponse) => {
      if (err.status === 401) handleExpiredToken(authService, router, snackBar, false);
      return throwError(() => err);
    })
  );
};

// 🧩 Decode JWT Expiry
function getTokenExpiry(token: string): number | null {
  try {
    const decoded: any = jwtDecode(token);
    return decoded?.exp ? decoded.exp * 1000 : null;
  } catch {
    return null;
  }
}

// 🧩 Logout + Navigation Handler
function handleExpiredToken(
  authService: AuthService,
  router: Router,
  snackBar: MatSnackBar,
  silent: boolean
) {
  // 🧠 Remember the route the user was on
  const currentUrl = router.url;
  localStorage.setItem('redirectUrl', currentUrl);

  // 🧹 Clear session/token
  authService.logout();

  // 🚪 Navigate to login
  router.navigate(['/login']);

  // 🔊 Optional snackbar message
  if (!silent) {
    snackBar.open('Session expired, please log in again.', 'Close', {
      duration: 4000,
      horizontalPosition: 'center',
      verticalPosition: 'top',
    });
  }
}

