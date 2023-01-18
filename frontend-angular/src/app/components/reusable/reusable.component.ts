import { Component, Input } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-reusable',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './reusable.component.html',
  styles: [
  ]
})
export class ReusableComponent {

  @Input() name = 'none';
}
