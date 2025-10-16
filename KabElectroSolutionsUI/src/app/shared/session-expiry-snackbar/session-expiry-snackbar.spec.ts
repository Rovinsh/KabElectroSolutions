import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SessionExpirySnackbar } from './session-expiry-snackbar';

describe('SessionExpirySnackbar', () => {
  let component: SessionExpirySnackbar;
  let fixture: ComponentFixture<SessionExpirySnackbar>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [SessionExpirySnackbar]
    })
    .compileComponents();

    fixture = TestBed.createComponent(SessionExpirySnackbar);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
