import { ApplicationConfig, provideBrowserGlobalErrorListeners, provideZoneChangeDetection, importProvidersFrom  } from '@angular/core';
import { provideRouter,withHashLocation, withInMemoryScrolling  } from '@angular/router';
import { provideHttpClient,withInterceptors  } from '@angular/common/http';
import {authInterceptor} from './interceptors/auth-interceptor'
import { routes } from './app.routes';
import { MatSnackBarModule } from '@angular/material/snack-bar';
import { MatButtonModule } from '@angular/material/button';
import { provideNativeDateAdapter } from '@angular/material/core';


export const appConfig: ApplicationConfig = {
  providers: [
    provideBrowserGlobalErrorListeners(),
    provideZoneChangeDetection({ eventCoalescing: true }),
    provideRouter(routes, withHashLocation(),   withInMemoryScrolling({
        scrollPositionRestoration: 'top',   // always scroll to top on route change
        anchorScrolling: 'enabled'
      })),
    provideHttpClient(withInterceptors([authInterceptor])),
    importProvidersFrom(MatSnackBarModule, MatButtonModule),
    provideNativeDateAdapter()
  ]
};
