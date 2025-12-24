import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CustomerVisit } from './customer-visit';

describe('CustomerVisit', () => {
  let component: CustomerVisit;
  let fixture: ComponentFixture<CustomerVisit>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [CustomerVisit]
    })
    .compileComponents();

    fixture = TestBed.createComponent(CustomerVisit);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
