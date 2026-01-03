import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { ApiService } from '../../services/api.service';

@Component({
  selector: 'app-register',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent {
  model = { firstName: '', lastName: '', email: '', phone: '', password: '' };

  constructor(private api: ApiService, private router: Router) {}

  register() {
    this.api.register(this.model).subscribe(() => {
      alert('Registered successfully!');
      this.router.navigate(['/store/login']);
    });
  }
}
