import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Updatepaymentdetails } from './updatepaymentdetails';

describe('Updatepaymentdetails', () => {
  let component: Updatepaymentdetails;
  let fixture: ComponentFixture<Updatepaymentdetails>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [Updatepaymentdetails]
    })
    .compileComponents();

    fixture = TestBed.createComponent(Updatepaymentdetails);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
