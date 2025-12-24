import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ShareEstimation } from './share-estimation';

describe('ShareEstimation', () => {
  let component: ShareEstimation;
  let fixture: ComponentFixture<ShareEstimation>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ShareEstimation]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ShareEstimation);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
