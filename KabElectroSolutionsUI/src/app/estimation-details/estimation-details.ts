import { Component,OnInit,Input,inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ApiService,EstimationDetailResponseDto} from '../services/api.service';
import { ToastService } from '../services/toastService.service';
import { MatIconModule } from '@angular/material/icon';
@Component({
  selector: 'app-estimation-details',
  imports: [CommonModule,MatIconModule],
  templateUrl: './estimation-details.html',
  styleUrl: './estimation-details.css'
})
export class EstimationDetails implements OnInit{
@Input() claimId!: string;
isLoading: boolean = false;
  estimationList: EstimationDetailResponseDto[] = [];
  grandTotal = 0;
  images :string[] = [];
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
         this.images = res.images;
      },
      error: (err:any) => {
        this.toast.error(err?.error || 'Error occured while loading the estimation!')
        this.isLoading = false; // hide spinner even on error
      }
  });
}
  coverageRemaining = 0;
  warrantyAmount = 0; 

  isImage(value?: string): boolean {
  return !!value?.startsWith('data:image/');
}

isVideo(value?: string): boolean {
  return !!value?.startsWith('data:video/');
}

isPdf(value?: string): boolean {
  return !!value?.startsWith('data:application/pdf');
}

openInNewTab(base64?: string) {
  if (!base64) return;

  const mimeType = this.detectMimeType(base64);

  // Remove prefix if exists
  const cleanBase64 = base64.includes(',')
    ? base64.split(',')[1]
    : base64;

  const byteCharacters = atob(cleanBase64);
  const byteNumbers = new Array(byteCharacters.length);

  for (let i = 0; i < byteCharacters.length; i++) {
    byteNumbers[i] = byteCharacters.charCodeAt(i);
  }

  const byteArray = new Uint8Array(byteNumbers);
  const blob = new Blob([byteArray], { type: mimeType });

  const blobUrl = URL.createObjectURL(blob);
  window.open(blobUrl, '_blank');
}

detectMimeType(base64: string): string {
  if (!base64) return 'application/octet-stream';

  // If data URL exists, extract MIME type
  if (base64.startsWith('data:')) {
    const match = base64.match(/^data:(.*?);base64,/);
    if (match && match[1]) {
      return match[1];
    }
  }

  // Fallback detection (magic numbers)
  const firstChars = base64.substring(0, 20);

  if (firstChars.startsWith('/9j')) return 'image/jpeg';
  if (firstChars.startsWith('iVBOR')) return 'image/png';
  if (firstChars.startsWith('R0lGOD')) return 'image/gif';
  if (firstChars.startsWith('JVBERi0')) return 'application/pdf';
  if (firstChars.startsWith('AAAA') || firstChars.startsWith('AAAB')) return 'video/mp4';

  return 'application/octet-stream';
}
}

