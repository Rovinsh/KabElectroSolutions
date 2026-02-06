import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { Router, NavigationEnd } from '@angular/router';
import { filter } from 'rxjs/operators';
import { WishlistService } from './store/services/wishlist.service';

@Component({
  selector: 'app-root',
  imports: [RouterOutlet],
  templateUrl: './app.html',
  styleUrl: './app.css'
})
export class App {
  isLoginPage = false;
  protected title = 'MSCareSolutions';
  
  ngOnInit() {
    this.wishlistService.restoreWishlist();
  }

  constructor(private router: Router,private wishlistService: WishlistService) {
    this.router.events
      .pipe(filter(event => event instanceof NavigationEnd))
      .subscribe((event: any) => {
        const url = event.urlAfterRedirects;
        // hide header & sidebar only if route is login
        this.isLoginPage = url.includes('/login') || url == "/";
      });
  }
}
