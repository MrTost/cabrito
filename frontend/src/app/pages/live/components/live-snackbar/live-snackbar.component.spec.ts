import { ComponentFixture, TestBed } from '@angular/core/testing';

import { LiveSnackbarComponent } from './live-snackbar.component';

describe('LiveSnackbarComponent', () => {
  let component: LiveSnackbarComponent;
  let fixture: ComponentFixture<LiveSnackbarComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [LiveSnackbarComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(LiveSnackbarComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
