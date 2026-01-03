import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { StoreHeaderComponent } from '../store/shared/component/store-header.component';
import { StoreFooterComponent } from '../store/shared/component/store-footer.component';
@Component({
  selector: 'app-store-layout',
  standalone: true,
  imports: [RouterOutlet, StoreHeaderComponent, StoreFooterComponent],
  templateUrl: './store-layout.html',
  styleUrl: './store-layout.css'
})
export class StoreLayout {

}
