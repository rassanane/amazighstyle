import { ComponentFixture, TestBed } from '@angular/core/testing';

import { HautComponent } from './haut.component';

describe('HautComponent', () => {
  let component: HautComponent;
  let fixture: ComponentFixture<HautComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [HautComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(HautComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
