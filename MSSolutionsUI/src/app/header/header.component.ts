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
  firstName:string = "";
  lastName: string | null = null;
  userRole: string = "";
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
     window.location.href = '#/login';
  }
  ngOnInit(): void {
this.auth.isLoggedin$.subscribe((loginData) => {
  this.firstName = localStorage.getItem("firstName")!;
  this.lastName = localStorage.getItem("lastName");
  this.userRole = localStorage.getItem("userRole")!;
  this.avatar= this.firstName.charAt(0)+this.lastName?.charAt(0);
});

  this.firstName = localStorage.getItem("firstName")!;
  this.lastName = localStorage.getItem("lastName");
  this.userRole = localStorage.getItem("userRole")!;
  this.avatar= this.firstName.charAt(0)+this.lastName?.charAt(0);
  }
}
