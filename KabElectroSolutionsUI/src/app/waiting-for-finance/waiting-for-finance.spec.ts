import { ComponentFixture, TestBed } from '@angular/core/testing';

import { WaitingForFinance } from './waiting-for-finance';

describe('WaitingForFinance', () => {
  let component: WaitingForFinance;
  let fixture: ComponentFixture<WaitingForFinance>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [WaitingForFinance]
    })
    .compileComponents();

    fixture = TestBed.createComponent(WaitingForFinance);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
