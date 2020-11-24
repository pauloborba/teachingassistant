import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EditarTurmaComponent } from './editar-turma.component';

describe('EditarTurmaComponent', () => {
  let component: EditarTurmaComponent;
  let fixture: ComponentFixture<EditarTurmaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EditarTurmaComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(EditarTurmaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
