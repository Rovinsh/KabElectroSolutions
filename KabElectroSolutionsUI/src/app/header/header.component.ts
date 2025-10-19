import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AuthService } from '../services/auth';

@Component({
  selector: 'app-header',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent {

constructor(private auth: AuthService)
{

}

  showDropdown = false;
  firstName:string="";
  lastName:string="";
  avatar: string="";

  toggleDropdown() {
    this.showDropdown = !this.showDropdown;
  }
  
  logout() {
    localStorage.clear();
    sessionStorage.clear();
    // if (window.location.pathname.includes('/crm')) {
    // window.location.href = 'crm/login';
    // }else
     window.location.href = 'login';
  }
  ngOnInit(): void {
  this.firstName = this.auth.firstName;
  this.lastName = this.auth.lastName;
  this.avatar= this.firstName.charAt(0)+this.lastName.charAt(0);
  }
}
