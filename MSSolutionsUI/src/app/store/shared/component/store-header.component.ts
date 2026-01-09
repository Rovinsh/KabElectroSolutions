import { Component, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { CartService } from '../../services/cart.service';
import { AuthService } from '../../../services/auth';
import { ToastService } from '../../../services/toastService.service';
import { MatDialog, MatDialogModule } from '@angular/material/dialog';
import { LoginComponent } from '../../Login/login.component';
@Component({
  selector: 'app-store-header',
  standalone: true,
  imports: [CommonModule, RouterModule,MatDialogModule],
  templateUrl: './store-header.component.html',
  styleUrls: ['./store-header.component.css']
})
export class StoreHeaderComponent {
  private toast = inject(ToastService);
  cartCount = 0;
  firstName:string = "";
  lastName: string | null = null;
   constructor(private cartService: CartService,private auth: AuthService,private dialog: MatDialog) {}
    showUserMenu = false;

  ngOnInit(): void {
  this.cartService.cartCount$.subscribe(count => {
  this.cartCount = count;
    });
  this.auth.isLoggedin$.subscribe((loginData) => {
  this.firstName = localStorage.getItem("firstName")!;
  this.lastName = localStorage.getItem("lastName");
  });
  this.firstName = localStorage.getItem("firstName")!;
  this.lastName = localStorage.getItem("lastName");
  }

custumerLogin() {
    if (!this.auth.isLoggedIn()) {
      this.openLoginPopup();
      return;
    }
}
 openLoginPopup() {
    const dialogRef = this.dialog.open(LoginComponent, {
      width: '700px',
      maxWidth: '95vw',
      maxHeight: '90vh',
      disableClose: true,
      panelClass: 'login-dialog',
    });
  
   dialogRef.afterClosed().subscribe(success => {
      if (success) {
        this.toast.success('Login successful');
      }
    });
  }

  logout() {
    localStorage.removeItem('token');
    localStorage.clear();
    sessionStorage.clear();
    location.href = '/store';
  }
}
