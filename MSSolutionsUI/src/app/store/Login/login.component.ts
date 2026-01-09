import { Component, inject } from '@angular/core';
import { MatDialogRef } from '@angular/material/dialog';
import { FormBuilder, FormGroup, Validators, AbstractControl } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule } from '@angular/forms';
import { HttpClient } from '@angular/common/http';
import { ToastService } from '../../services/toastService.service';
import { ApiService } from '../../services/api.service';
import { AuthService } from '../../services/auth';
import { Router } from '@angular/router';
@Component({
  selector: 'app-login',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule],
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent {

  mode: 'login' | 'signup' = 'login';
  isSubmitting = false;
  loginForm: FormGroup;
  signupForm: FormGroup;
  private apiService = inject(ApiService);
  private toast = inject(ToastService);
  
  constructor(
    private dialogRef: MatDialogRef<LoginComponent>,
    private fb: FormBuilder,
    private http: HttpClient,
    private auth: AuthService,
     private router: Router
  ) {
    this.loginForm = this.fb.group({
      username: ['', [Validators.required, Validators.email]],
      password: ['', Validators.required]
    });

    this.signupForm = this.fb.group({
      firstName: ['', Validators.required],
      lastName: ['', Validators.required],
      email: ['', [Validators.required, Validators.email]],
      phone: ['', [Validators.required, Validators.pattern(/^\d{10}$/)]],
      password: ['', [Validators.required, Validators.minLength(6)]],
      confirmPassword: ['', Validators.required],
    }, { validators: this.passwordMatchValidator });
  }

  passwordMatchValidator(form: AbstractControl) {
    const pass = form.get('password')?.value;
    const confirm = form.get('confirmPassword')?.value;
    return pass === confirm ? null : { passwordMismatch: true };
  }

  get lf() {
    return this.loginForm.controls;
  }

  get sf() {
    return this.signupForm.controls;
  }

  switchMode(mode: 'login' | 'signup') {
    this.mode = mode;
  }

  close() {
    this.dialogRef.close(false);
  }
private handleLoginSuccess(res: any, loginData: { username: string; password: string }) {
    this.auth.saveToken(res.token);
    this.auth.username = loginData.username;
    this.auth.password = loginData.password;
    this.auth.firstName = res.data.firstname;
    this.auth.lastName = res.data.lastname ?? '';
    this.auth.userRole = res.data.businessrole_name;

    localStorage.setItem('firstName', this.auth.firstName);
    localStorage.setItem('lastName', this.auth.lastName);
    localStorage.setItem('userRole', this.auth.userRole ?? '');

    this.auth.isLoggedin$.next(1);

    // Notify parent that login/signup succeeded
    this.dialogRef.close(true);
  }


 submit() {
    if (this.mode === 'login') {
      if (this.loginForm.invalid) return;

      const loginData = { ...this.loginForm.value };

      this.auth.login(loginData).subscribe({
        next: res => this.handleLoginSuccess(res, loginData),
        error: (error: any) => this.toast.error(error.error?.message || 'Something went wrong!')
      });
    } else {
      if (this.signupForm.invalid) return;
      const formData = { ...this.signupForm.value };
      this.isSubmitting = true;

      this.apiService.postUserCreate(formData).subscribe({
        next: () => {
          this.toast.success('User Created Successfully!');

          // 🔥 Auto-login after signup
          const loginData = {
            username: formData.email,
            password: formData.password
          };

          this.auth.login(loginData).subscribe({
            next: res => this.handleLoginSuccess(res, loginData),
            error: () => this.toast.error('Login failed after signup')
          });

          this.isSubmitting = false;
        },
        error: () => {
          this.toast.error('Signup failed');
          this.isSubmitting = false;
        }
      });
    }
  }
}
