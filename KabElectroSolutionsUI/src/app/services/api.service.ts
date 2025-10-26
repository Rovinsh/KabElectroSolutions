import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class ApiService {
  //For local
  private baseUrl = 'https://localhost:7181/api/';
  //for serve 
  //private baseUrl = 'https://kabelectro.in/API/api/';

  constructor(private http: HttpClient) {}

  getClaims(controllerName:string): Observable<any> {
    return this.http.get(`${this.baseUrl+controllerName}`);
  }
   getStatus(controllerName:string): Observable<any> {
    return this.http.get(`${this.baseUrl+controllerName}`);
  }

  getLocations(): Observable<LocationResponseDto> {
    return this.http.get<LocationResponseDto>(`${this.baseUrl+"Locations/locations"}`);
  }

  getStates(): Observable<StateResponseDto> {
    return this.http.get<StateResponseDto>(`${this.baseUrl+"Locations/states"}`);
  }
  getCities(): Observable<CityResponseDto> {
    return this.http.get<CityResponseDto>(`${this.baseUrl+"Locations/cities"}`);
  }
  getPincodes(): Observable<PincodeResponseDto> {
    return this.http.get<PincodeResponseDto>(`${this.baseUrl+"Locations/pincodes"}`);
  }

  getWarrantyTypes(): Observable<WarrantyTypeResponseDto> {
    return this.http.get<WarrantyTypeResponseDto>(`${this.baseUrl+"WarrantyTypes/warrantyTypes"}`);
  }

  getCategories(): Observable<CategoryResponseDto> {
    return this.http.get<CategoryResponseDto>(`${this.baseUrl + "Categories/categories"}`);
  }

  getPlans(): Observable<PlanResponseDto> {
    return this.http.get<PlanResponseDto>(`${this.baseUrl + "Plans/plans"}`);
  }

  getBrands(): Observable<BrandResponseDto> {
    return this.http.get<BrandResponseDto>(`${this.baseUrl + "Brands/brands"}`);
  }
  getWarranty(): Observable<WarrantyResponseDto> {
    return this.http.get<WarrantyResponseDto>(`${this.baseUrl + "Warranties/warranties"}`);
  }

  getWarranties(phone?: string, email?: string): Observable<WarrantyDto[]> {
    const params: any = {};
    if (phone) params.phone = phone;
    if (email) params.email = email;

    return this.http.get<WarrantyDto[]>(`${this.baseUrl}Warranties/byparameter`, { params });
  }

  postCategory(categoryData: CategoryDto): Observable<any> {
    return this.http.post(`${this.baseUrl}Categories`, categoryData);
  }

  postBarands(brandData: BrandDto): Observable<any> {
    return this.http.post(`${this.baseUrl}Brands`, brandData);
  }

  postPlans(planData: PlanDto): Observable<any> {
    return this.http.post(`${this.baseUrl}Plans`, planData);
  }

  postWarranties(warrantyData: WarrantyDto): Observable<any> {
    return this.http.post(`${this.baseUrl}Warranties`, warrantyData);
  }

 updateCategory(id: number, categoryData: CategoryDto): Observable<any> {
  return this.http.post(`${this.baseUrl}Categories/${id}`, categoryData);
  }

 updateBrand(id: number, brandData: BrandDto): Observable<any> {
  return this.http.post(`${this.baseUrl}Brands/${id}`, brandData);
  }

  updatePlan(id: number, planData: PlanDto): Observable<any> {
    return this.http.post(`${this.baseUrl}Plans/${id}`, planData);
  }
  
  updateWarranties(id: number, warranties: WarrantyDto): Observable<any> {
    return this.http.post(`${this.baseUrl}Warranties/${id}`, warranties);
  }
  
  postClaim(claimData: ClaimDto): Observable<any> {
    return this.http.post(`${this.baseUrl}Claims`, claimData);
  }
  
}

export interface LocationResponseDto {
  status: number;
  message: string;
  data: { [stateId: string]: LocationDto };
}

export interface LocationDto {
  name: string;
  cities: { [cityId: string]: CityDto };
}

export interface StateDto {
  name: string;
  id: number;
}

export interface WarrantyTypeDto {
  name: string;
  id: number;
}

export interface WarrantyTypeResponseDto {
  status: number;
  message: string;
  data: WarrantyTypeDto[];
}

export interface StateResponseDto {
  status: number;
  message: string;
  data: StateDto[];
}

export interface CityDto {
  name: string;
  pincodes: number[];
}

export interface CityResponseDto {
  status: number;
  message: string;
  data: CitiesDto[];
}
export interface CitiesDto {
  name: string;
  id: number;
  stateId: number;
}

export interface PincodeResponseDto {
  status: number;
  message: string;
  data: PincodeDto[];
}
export interface PincodeDto {
  pincode: number;
  id: number;
  cityId: number;
}

export interface CategoryDto {
  name: string;
  id: number;
}

export interface BrandDto {
  brandName: string;
  categoryName: string;
  id: number;
  categoryId:number;
}


export interface CategoryDto {
  catName: string;
  description: string;
  isDisable: boolean;
  id: number;
}

export interface CategoryResponseDto {
  status: number;
  message: string;
  data: CategoryDto[];
}

export interface PlanDto {
  planName: string;
  categoryName:string,
  id: number;
  catId: number;
  description: string;
  remark: string;
  isDisable: boolean;
}

export interface PlanResponseDto {
  status: number;
  message: string;
  data: PlanDto[];
}

export interface BrandDto {
  brandName: string;
  id: number;
  categoryId: number;
  description: string;
  isDisable: boolean;
}

export interface BrandResponseDto {
  status: number;
  message: string;
  data: BrandDto[];
}

export interface WarrantyDto {
  id: number;
  serialNumber: number;
  warrantyType: string;
  catgoryName: string;
  warrantyTypeId: number;
  warrantyDisplayName: string;
  warrantyCode: string;
  warrantyPrice: number;
  warrantyDuration: number;
  warrantyStartDate: string;
  warrantyEndDate: string;
  warrantyInvoiceNo: string;
  warrantyPurchaseDate: string;
  warrantySeller?: string;
  warrantyCouponCode?: string;
  warrantyScratchCode?: string;
  warrantyExtraInfo?: string;
  warrantyDescription?: string;
  warrantyCreatedBy?: string;
  productId: number;
  productName: string;
  customerName: string;
  customerMobileNo: string;
  customerEmail: string;
  customerAddress: string;
  cityId: number;
  customerCityName: string;
  stateId: number;
  customerStateName: string;
  pinCodeId: number;
  customerPinCode: number;
  isDisable:boolean;
}

export interface WarrantyResponseDto {
  status: number;
  message: string;
  data: WarrantyDto[];
}

export interface ClaimDto {
  id?: number;
  technicianName?: string;
  lmStatus?: string;
  itemName?: string;
  rating?: number | null;
  l3ApprovalDate?: string | null;
  servicePartner?: number;
  otpRequired?: boolean;
  displayName?: string;
  reasons?: string;
  callCloseRemarks?: string;
  concern?: string;
  claimRegisteredPhoneNumber?: string;
  reasonOfLoss?: string;
  estimationFirst?: number | null;
  solvyPan?: string;
  l2ServiceRejectionRemarks?: string;
  servicePartnerName?: string;
  voiceUrl?: string;
  estimationParts?: string;
  customerAddress?: string;
  brandComplaintNumber?: string;
  address?: number;
  otpVerificationTimestamp?: string | null;
  warrantyStartDate?: string | null;
  channelId?: number;
  phone?: string;
  itemPrice?: number;
  warrantyDuration?: number;
  invoiceDate?: string | null;
  assignedExecutiveName?: string;
  alternateContact?: string;
  planSoldDate?: string;
  raiseAdditional?: boolean;
  warrantyTypeId?: number;
  customerState?: string;
  itemSerialNumber?: string;
  solvyAddress?: string;
  endDate?: string | null;
  itemBrand?: string;
  l2ServiceApprovalDate?: string | null;
  claimVerificationDocumentUploadTimestamp?: string | null;
  customerEmail?: string;
  channelName?: string;
  claimRedeemStatus?: string;
  createdTime?: string; 
  endStatus?: string;
  l2InsuranceRejectionRemarks?: string;
  callAbortDateTime?: string | null;
  servicePartnerCity?: string;
  estimationDateTime?: string | null;
  estimationActionDate?: string | null;
  repairCompletionDate?: string | null;
  warrantyActivationCode?: string;
  invoiceActionDate?: string | null;
  status?: number;
  itemImei?: string;
  hsnRequired?: boolean;
  pincode?: number;
  estimationLast?: number | null;
  servicePartnerPhone?: string;
  itemCategory?: string;
  technician?: string;
  startDate?: string | null;
  customerAlternateEmail?: string;
  servicePartnerState?: string;
  claimRedeemedDate?: string | null;
  l2InsuranceApprovalDate?: string | null;
  utrNumber?: string;
  extraInfo?: string;
  appointmentConfirmationTime?: string | null;
  created?: string;
  claimRedeemed?: boolean;
  previousVisitProductSerialNumber?: string;
  servicePartnerGST?: string;
  callAbortReason?: string;
  insuredCompany?: string;
  solvyGST?: string;
  paymentDone?: string;
  servicePartnerPincode?: number;
  claimApproved?: number;
  appointmentPendingReason?: string;
  insured?: string;
  statusName?: string;
  selfInvoice?: string;
  servicePartnerPAN?: string;
  servicePartnerAddress?: string;
  storeName?: string;
  l1ApprovalDate?: string | null;
  previousStatus?: number;
  firstVisitTAT?: number | null;
  paymentStatus?: string;
  estimationPaymentAmount?: number | null;
  customerPhone?: string;
  warranty?: number;
  claimPaymentStatus?: string;
  registeredBy?: number;
  l1RejectionRemarks?: string;
  dropDate?: string | null;
  cta?: string;
  customerCity?: string;
  item?: number;
  isAddressEditable?: boolean;
  registeredByName?: string;
  l3RejectionRemarks?: string;
  createdDate?: string;
  claimType?: number;
  repairDoneTAT?: number | null;
  warrantyType?: string;
  pickupDate?: string | null;
  itemCategoryId?: number;
  paymentId?: string;
  remarks?: string;
  type?: string;
  claimAmount?: number | null;
  appointment?: number;
  solvyStateCode?: string;
  paymentTxnId?: string;
  paymentAmount?: number | null;
  amount?: number | null;
  invoiceNumber?: string;
  customerName?: string;
  sgst?: string;
  cgst?: string;
  igst?: string;
  sgsTList?: string[];
  cgsTList?: string[];
  igsTList?: string[];
}



export interface ClaimResponseDto {
  status: number;
  message: string;
  data: ClaimDto[];
}
