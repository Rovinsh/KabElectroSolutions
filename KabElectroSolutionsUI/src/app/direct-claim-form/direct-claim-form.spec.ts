import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DirectClaimForm } from './direct-claim-form';

describe('DirectClaimForm', () => {
  let component: ClaimForm;
  let fixture: ComponentFixture<ClaimForm>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ClaimForm]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ClaimForm);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
