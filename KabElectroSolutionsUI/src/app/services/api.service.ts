import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class ApiService {
  private baseUrl = 'https://localhost:7181/api/';

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
  name: string;
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
  id: number;
  catId: number;
  categoryId: number;
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
  isZappEnable: boolean;
  status: number;
  serialNumber: number;
  regionId: number;
  displayName?: string;
  policyId: number;
  rmId: number;
  activationCode?: string;
  price: number;
  extraInfo?: string;
  duration: number;
  productExtraImage?: string;
  discrepancyReason?: string;
  storeAssignedAt?: string;
  active: boolean;
  verified: boolean;
  distributorAssignedAt?: string;
  warrantyInvoiceNo?: string;
  startDate?: string;
  endDate?: string;
  productId: number;
  discrepants?: string;
  purchaseDate?: string;
  endorsementNo?: string;
  seller?: string;
  couponCode?: string;
  cancellationAt?: string;
  cancellationDoneBy?: string;
  scratchCode?: string;
  kitCoverage?: string;
  oemId: number;
  brandWarrantyDuration: number;
  cancellationReason?: string;
  type: number;
  insured?: string;
  cancellationRole?: string;
}

export interface WarrantyResponseDto {
  status: number;
  message: string;
  data: WarrantyDto[];
}
