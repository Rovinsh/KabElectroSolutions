import { Component } from '@angular/core';
import { ReactiveFormsModule, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import { AuthService } from '../services/auth';
import { ToastService } from '../services/toastService.service';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule],
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
})
export class LoginComponent {
  loginForm: FormGroup;

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

      this.auth.login(loginData)
        .subscribe({
          next: (res: any) => {
            this.auth.saveToken(res.token);
            this.toast.success('Loged in Successfully!');
            this.router.navigate(['/dashboard']);
          },
          error: (error:any) => {
            this.toast.error(error.error?.message || 'Something went wrong!');
          }
          //error: () => alert('Invalid credentials'),
        });


      // this.http.post('https://localhost:7181/api/Login/login', loginData)
      //   .subscribe({
      //     next: (response:any) => {
      //       console.log('Login successful:', response);
      //       // Login success → redirect to dashboard
      //     this.router.navigate(['/dashboard']);
      //     },
      //     error: (error:any) => {
      //       console.error('Login failed:', error);
      //     }
      //   });
    }
  }
}
