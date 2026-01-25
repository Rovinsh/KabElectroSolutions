import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ReviewInvoice } from './review-invoice';

describe('ReviewInvoice', () => {
  let component: ReviewInvoice;
  let fixture: ComponentFixture<ReviewInvoice>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ReviewInvoice]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ReviewInvoice);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
