import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EpgComponent } from './epg.component';

describe('EpgComponent', () => {
  let component: EpgComponent;
  let fixture: ComponentFixture<EpgComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [EpgComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(EpgComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
