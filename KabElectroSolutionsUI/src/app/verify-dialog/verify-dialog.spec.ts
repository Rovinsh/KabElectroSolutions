import { ComponentFixture, TestBed } from '@angular/core/testing';

import { VerifyDialog } from './verify-dialog';

describe('VerifyDialog', () => {
  let component: VerifyDialog;
  let fixture: ComponentFixture<VerifyDialog>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [VerifyDialog]
    })
    .compileComponents();

    fixture = TestBed.createComponent(VerifyDialog);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
