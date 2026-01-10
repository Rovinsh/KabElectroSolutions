import { inject, Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import {jwtDecode} from 'jwt-decode';
import { BehaviorSubject, Subject, tap } from 'rxjs';
import { WishlistService } from '../store/services/wishlist.service';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
   //For local
   private apiUrl = 'https://localhost:7181/api';
   isLoggedin$ = new Subject<number>();
  //for serve 
  //private apiUrl = 'https://kabelectro.in/API/api';
  private wishlistService = inject(WishlistService);
  username:string="";
  password:string="";
  firstName:string="";
  lastName:string="";
  userRole: string="";
  constructor(private http: HttpClient) { }

  login(loginData: any) {
    return this.http.post(
      `${this.apiUrl}/Login/login`, loginData );
       tap(res => this.wishlistService.loadWishlist())
  }

  saveToken(token: string) {
    localStorage.setItem('token', token);

  }

  getToken() {
    return localStorage.getItem('token');
  }

  getRoles(): string[] {
    const token = this.getToken();
    if (!token) return [];
    const decoded: any = jwtDecode(token);
    const roles =
      decoded['http://schemas.microsoft.com/ws/2008/06/identity/claims/role'];
    return Array.isArray(roles) ? roles : [roles];
  }

  logout() {
    localStorage.removeItem('token');
    this.username="";
    this.password="";
    this.firstName="";
    this.lastName="";
    localStorage.removeItem('firstName');
    localStorage.removeItem('lastName');
    localStorage.removeItem('userRole');
    //localStorage.removeItem('redirectUrl');
  }

  isLoggedIn(): boolean {
    return !!this.getToken();
  }
}
