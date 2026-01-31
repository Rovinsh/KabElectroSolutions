import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ClaimBulkImport } from './claim-bulk-import';

describe('ClaimBulkImport', () => {
  let component: ClaimBulkImport;
  let fixture: ComponentFixture<ClaimBulkImport>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ClaimBulkImport]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ClaimBulkImport);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
