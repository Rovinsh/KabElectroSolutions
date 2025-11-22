import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AssignPartner } from './assign-partner';

describe('AssignPartner', () => {
  let component: AssignPartner;
  let fixture: ComponentFixture<AssignPartner>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [AssignPartner]
    })
    .compileComponents();

    fixture = TestBed.createComponent(AssignPartner);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
