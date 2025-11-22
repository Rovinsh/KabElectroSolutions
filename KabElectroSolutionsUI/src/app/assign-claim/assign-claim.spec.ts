import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AssignClaim } from './assign-claim';

describe('AssignClaim', () => {
  let component: AssignClaim;
  let fixture: ComponentFixture<AssignClaim>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [AssignClaim]
    })
    .compileComponents();

    fixture = TestBed.createComponent(AssignClaim);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
