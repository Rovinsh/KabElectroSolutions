import { Component } from '@angular/core';
import { ReactiveFormsModule, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import { AuthService } from '../services/auth';
import { ToastService } from '../services/toastService.service';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule,MatProgressSpinnerModule],
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
})
export class LoginComponent {
  loginForm: FormGroup;
  isLoading = false;

  constructor(private fb: FormBuilder, private http: HttpClient, private router: Router, private auth: AuthService, private toast :ToastService) {
    this.loginForm = this.fb.group({
      username: ['', Validators.required],
      password: ['', Validators.required],
    });
  }

  get email() {
    return this.loginForm.get('username')!;
  }

  get password() {
    return this.loginForm.get('password')!;
  }

  onSubmit() {
    if (this.loginForm.valid) {
      const loginData = this.loginForm.value;
      this.isLoading = true;

      this.auth.login(loginData)
        .subscribe({
          next: (res: any) => {
            this.auth.saveToken(res.token);
            this.auth.username = loginData.username;
            this.auth.password = loginData.password;
            this.auth.firstName = res.data.firstname;
            this.auth.lastName = res.data.lastname??"";            
             this.auth.userRole = res.data.businessrole_name;
            localStorage.setItem('firstName', this.auth.firstName);
            localStorage.setItem('lastName', this.auth.lastName??"");
            localStorage.setItem('userRole', this.auth.userRole??"");
            const redirectUrl = localStorage.getItem('redirectUrl');
             this.isLoading = false;
        if (redirectUrl) {
          localStorage.removeItem('redirectUrl');
          this.router.navigateByUrl(redirectUrl);
        } else {
          this.router.navigate(['/dashboard']); // fallback route
        }
        this.auth.isLoggedin$.next(loginData);
          },
          error: (error:any) => {
             this.isLoading = false;
            this.toast.error(error.error?.message || 'Something went wrong!');
          }
          //error: () => alert('Invalid credentials'),
        });
    }
  }
}
