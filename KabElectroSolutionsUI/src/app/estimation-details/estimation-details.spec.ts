import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EstimationDetails } from './estimation-details';

describe('EstimationDetails', () => {
  let component: EstimationDetails;
  let fixture: ComponentFixture<EstimationDetails>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [EstimationDetails]
    })
    .compileComponents();

    fixture = TestBed.createComponent(EstimationDetails);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
