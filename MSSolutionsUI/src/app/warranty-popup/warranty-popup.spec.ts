import { ComponentFixture, TestBed } from '@angular/core/testing';

import { WarrantyPopupComponent } from './warranty-popup';

describe('WarrantyPopupComponent', () => {
  let component: WarrantyPopupComponent;
  let fixture: ComponentFixture<WarrantyPopupComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [WarrantyPopupComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(WarrantyPopupComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
