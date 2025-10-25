import { ApplicationConfig, provideBrowserGlobalErrorListeners, provideZoneChangeDetection, importProvidersFrom  } from '@angular/core';
import { provideRouter,withHashLocation  } from '@angular/router';
import { provideHttpClient,withInterceptors  } from '@angular/common/http';
import {authInterceptor} from './interceptors/auth-interceptor'
import { routes } from './app.routes';
import { MatSnackBarModule } from '@angular/material/snack-bar';
import { MatButtonModule } from '@angular/material/button';


export const appConfig: ApplicationConfig = {
  providers: [
    provideBrowserGlobalErrorListeners(),
    provideZoneChangeDetection({ eventCoalescing: true }),
    provideRouter(routes, withHashLocation()),
    provideHttpClient(withInterceptors([authInterceptor])),
    importProvidersFrom(MatSnackBarModule, MatButtonModule)
  ]
};
