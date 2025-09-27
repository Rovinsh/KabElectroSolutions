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