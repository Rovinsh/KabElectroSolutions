import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CloseWithOrWithoutRepairDialog } from './close-with-or-without-repair-dialog';

describe('CloseWithOrWithoutRepairDialog', () => {
  let component: CloseWithOrWithoutRepairDialog;
  let fixture: ComponentFixture<CloseWithOrWithoutRepairDialog>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [CloseWithOrWithoutRepairDialog]
    })
    .compileComponents();

    fixture = TestBed.createComponent(CloseWithOrWithoutRepairDialog);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
