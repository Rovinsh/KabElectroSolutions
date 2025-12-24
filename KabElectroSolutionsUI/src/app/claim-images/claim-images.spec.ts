import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ClaimImages } from './claim-images';

describe('ClaimImages', () => {
  let component: ClaimImages;
  let fixture: ComponentFixture<ClaimImages>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ClaimImages]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ClaimImages);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
