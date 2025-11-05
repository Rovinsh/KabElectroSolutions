import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ServicePartnerFormComponent } from './service-partner-form';

describe('ServicePartnerForm', () => {
  let component: ServicePartnerFormComponent;
  let fixture: ComponentFixture<ServicePartnerFormComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ServicePartnerFormComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ServicePartnerFormComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
