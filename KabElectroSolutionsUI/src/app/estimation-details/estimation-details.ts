import { Component,OnInit,Input,inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ApiService,EstimationDetailResponseDto} from '../services/api.service';
import { ToastService } from '../services/toastService.service';
@Component({
  selector: 'app-estimation-details',
  imports: [CommonModule],
  templateUrl: './estimation-details.html',
  styleUrl: './estimation-details.css'
})
export class EstimationDetails implements OnInit{
@Input() claimId!: string;
isLoading: boolean = false;
  estimationList: EstimationDetailResponseDto[] = [];
  grandTotal = 0;
   private toast = inject(ToastService);
constructor(private apiService: ApiService){}

ngOnInit(): void {
  this.isLoading = true;
this.apiService.GetClaimEstimationDetails(parseInt(this.claimId))
  .subscribe({    
    next: (res:any) => {        
        this.isLoading = false; // hide spinner
         this.estimationList = res.items;
         this.grandTotal = res.grandTotal;
      },
      error: (err:any) => {
        this.toast.error(err?.error || 'Error occured while loading the estimation!')
        this.isLoading = false; // hide spinner even on error
      }
  });
}
  coverageRemaining = 0;
  warrantyAmount = 0; 
}
