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
  //private baseUrl = 'https://mscareprime.in/API/api/';

  constructor(private http: HttpClient) {}


  getAuditLogs(controllerName:string): Observable<any> {
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

  getWishlist(): Observable<WishlistResponseDto> {
    return this.http.get<WishlistResponseDto>(`${this.baseUrl + "Wishlist/wishlist"}`);
  }
  getCategories(): Observable<CategoryResponseDto> {
    return this.http.get<CategoryResponseDto>(`${this.baseUrl + "Categories/categories"}`);
  }
 getGst(): Observable<GstResponseDto> {
    return this.http.get<GstResponseDto>(`${this.baseUrl + "Gst/gst"}`);
  }

   getProduct(): Observable<ProductWithImageResponseDto> {
    return this.http.get<ProductWithImageResponseDto>(`${this.baseUrl + "Product/products"}`);
  }
  getCoupon(): Observable<CouponResponseDto> {
    return this.http.get<CouponResponseDto>(`${this.baseUrl + "Coupon/coupons"}`);
  }

  getBrands(): Observable<BrandResponseDto> {
    return this.http.get<BrandResponseDto>(`${this.baseUrl + "Brands/brands"}`);
  }

  getProductImages(productId: number) {
  return this.http.get<ProductImageResponseDto>(
    `${this.baseUrl}product/GetImages/${productId}`
  );
}
 deleteProductImage(imageId: number) {
    return this.http.delete(`${this.baseUrl}product/DeleteImage/${imageId}`);
  }

 getUsers(userType: string = 'user'): Observable<UserResponseDto> {
  return this.http.get<UserResponseDto>(`${this.baseUrl}Users/users/${userType}`);
}
 getCustomrs(userType: string = 'customer'): Observable<UserResponseDto> {
  return this.http.get<UserResponseDto>(`${this.baseUrl}Users/users/${userType}`);
}

 getOrders(): Observable<OrderResponseDto> {
    return this.http.get<OrderResponseDto>(`${this.baseUrl + "Orders/orders"}`);
  }

  getRoles(): Observable<Role[]> {
    return this.http.get<Role[]>(`${this.baseUrl + "Roles/roles"}`);
  }

  getUserAddresses(): Observable<AddressResponseDto> {
    return this.http.get<AddressResponseDto>(`${this.baseUrl + "Users/Address"}`);
  }

 addWishlist(productId: number): Observable<any> {
    return this.http.post(`${this.baseUrl}Wishlist/AddWishlist`, { productId });
  }

removeWishlist(productId: number): Observable<any> {
    return this.http.post(`${this.baseUrl}Wishlist/removeWishlist`, { productId });
  }
  postCategory(categoryData: CategoryDto): Observable<any> {
    return this.http.post(`${this.baseUrl}Categories`, categoryData);
  }

  postGst(GstData: GstDto): Observable<any> {
    return this.http.post(`${this.baseUrl}Gst`, GstData);
  }

  postBarands(brandData: BrandDto): Observable<any> {
    return this.http.post(`${this.baseUrl}Brands`, brandData);
  }

 postUserCreate(userData: SignupRequestDto): Observable<any> {
    return this.http.post(`${this.baseUrl}Users/CreateCustomer`, userData);
  }
  postProduct(productData: ProductDto): Observable<any> {
    return this.http.post(`${this.baseUrl}Product`, productData);
  }
  postCoupon(couponData: CouponDto): Observable<any> {
    return this.http.post(`${this.baseUrl}Coupon`, couponData);
  }

 postUser(userData: UserDto): Observable<any> {
    return this.http.post(`${this.baseUrl}Users`, userData);
  }

applyCoupon(payload: ApplyCouponRequestDto): Observable<ApplyCouponResponseDto> {
  return this.http.post<ApplyCouponResponseDto>(
    `${this.baseUrl}ApplyCoupons/apply`,
    payload
  );
}
 updateCategory(id: number, categoryData: CategoryDto): Observable<any> {
  return this.http.post(`${this.baseUrl}Categories/${id}`, categoryData);
  }

 updateGst(id: number, gstData: GstDto): Observable<any> {
  return this.http.post(`${this.baseUrl}Gst/${id}`, gstData);
  }

 updateBrand(id: number, brandData: BrandDto): Observable<any> {
  return this.http.post(`${this.baseUrl}Brands/${id}`, brandData);
  }

 updateProduct(id: number, productData: ProductDto): Observable<any> {
    return this.http.post(`${this.baseUrl}Product/${id}`, productData);
  }
   updateCoupon(id: number, couponData: CouponDto): Observable<any> {
    return this.http.post(`${this.baseUrl}Coupon/${id}`, couponData);
  }
  
  updateUser(id: number, userData: UserDto): Observable<any> {
    return this.http.post(`${this.baseUrl}Users/${id}`, userData);
  }

 updateProductImages(formData: any): Observable<any> {
    return this.http.post(`${this.baseUrl}product/AddImages`,formData);
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
export interface WishlistDto {
  productId: number;
}
export interface WishlistResponseDto {
  status: number;
  message: string;
  data: WishlistDto[];
}
export interface GstDto {
  gstValue: string;
  description: string;
  isDisable: boolean;
  id: number;
}

export interface GstResponseDto {
  status: number;
  message: string;
  data: GstDto[];
}
export interface SignupRequestDto {
  firstName: string;
  lastName: string;
  email: string;
  phone: string;
  password: string;
}
export interface SignupRequestResponseDto {
  status: number;
  message: string;
  data: SignupRequestDto[];
}
export interface CouponDto {
  id: number;
  couponTitle: string;
  couponCode: string;
  discountType: 'percentage' | 'fixed';
  couponAmount: number;
  couponStartDate: string; // ISO date
  couponEndDate: string;
  description?: string;
  remark?: string;
  isExpired: boolean;
  isFirstOrder: boolean;
  isAllProducts: boolean;
  isDisable: boolean;
}
export interface ApplyCouponRequestDto {
  couponCode: string;
  cartTotal: number;
  productIds: number[];
}
export interface ApplyCouponDto {
  couponId: number;
  couponCode: string;
  discountAmount: number;
  finalAmount: number;
  discountType: 'percentage' | 'fixed';
}

export interface ApplyCouponResponseDto {
  status: number;
  message: string;
  data: ApplyCouponDto;
}

export interface CouponResponseDto {
  status: number;
  message: string;
  data: CouponDto[];
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

export interface ProductDto {
  id: number;
  productName: string;
  sku: string;
  categoryId: number;
  categoryName: string;
  brandId: number;
  brandName: string;
  baseAmount: number;
  gstId: number;
  gstPercentage: number;
  gstAmount: number;
  withGstAmount: number;
  stockQty: number;
  discountPrice: number;
  shortDescription: string;
  description: string;
  isActive: boolean;
}
export interface ProductResponseDto {
  status: number;
  message: string;
  data: ProductDto[];
}

export interface UserDto {
  id: number;
  firstName: string;
  lastName: string;
  cityId: number;
  cityName: string;
  stateId: number;
  pinCodeId: number;
  pinCode: string;
  stateName: string;
  address: string;
  phone: string;
  email:string;
}

export interface UserResponseDto {
  status: number;
  message: string;
  data: UserDto[];
}
export interface AddressDto {
  id: number;            // unique id
  fullName: string;
  phone: string;
  addressLine: string;
  city: string;
  state: string;
  pincode: number;
  isDefault?: boolean;   // optional default flag
}
export interface AddressResponseDto {
  status: number;
  message: string;
  data: AddressDto[];
}
export interface OrderDTO {
  id: number;
  orderCode: string;
  userId: number;
  userName: string;

  subTotal: number;
  taxAmount: number;
  shippingAmount: number;
  discountAmount: number;
  grandTotal: number;
  receiveAmount: number;

  paymentStatus: string;
  orderStatus: string;

  couponCode?: string;
  razorpayOrderId?: string;
  razorpayPaymentId?: string;
  razorpaySignature?: string;

  orderDate: string;      // ISO Date string
  paymentDate: string;    // ISO Date string
  createdAt: string;      // ISO Date string

  orderDetails: OrderDetailDTO[];
  billingAddress: BillingAddressDTO;
  shippingAddress: ShippingAddressDTO;
}
export interface OrderDTO {
  id: number;
  orderCode: string;
  userId: number;
  userName: string;

  subTotal: number;
  taxAmount: number;
  shippingAmount: number;
  discountAmount: number;
  grandTotal: number;
  couponAmount:number;
  receiveAmount: number;

  paymentStatus: string;
  orderStatus: string;

  couponCode?: string;
  razorpayOrderId?: string;
  razorpayPaymentId?: string;
  razorpaySignature?: string;

  orderDate: string;      // ISO Date string
  paymentDate: string;    // ISO Date string
  createdAt: string;      // ISO Date string

  orderDetails: OrderDetailDTO[];
  billingAddress: BillingAddressDTO;
  shippingAddress: ShippingAddressDTO;
}
export interface OrderDetailDTO {
  id: number;
  productId: number;
  categoryName: string; 
  productName: string; 
  brandName: string; 
  unitPrice: number;
  quantity: number;
  discount: number;
  totalAmount: number;
}
export interface BillingAddressDTO {
  fullName?: string;
  phone?: string;
  addressLine?: string;
  city?: string;
  state?: string;
  pincode?: string;
}
export interface ShippingAddressDTO {
  fullName?: string;
  phone?: string;
  addressLine?: string;
  city?: string;
  state?: string;
  pincode?: string;
  country?: string;
}
export interface OrderResponseDto {
  status: number;
  message: string;
  data: OrderDTO[];
}

export interface Role{
  roleId: number;
  roleName: string;
}

export interface  ProductImageResponseDto {
  status: number;
  message: string;
  data: ProductImageDto[];
}
export interface ProductImageDto {
  id: number;
  productId: number;
  fileName: string;
  imageBase64: string;
}
export interface ProductWithImagesDto extends ProductDto {
  images: ProductImageDto[];
}

export interface  ProductWithImageResponseDto {
  status: number;
  message: string;
  data: ProductWithImagesDto[];
}