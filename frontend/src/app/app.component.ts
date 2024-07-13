import { Component, HostListener } from '@angular/core';
import { RouterOutlet } from '@angular/router';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet],
  templateUrl: './app.component.html',
  styleUrl: './app.component.scss',
})
export class AppComponent {
  title = 'cabrito';

  idleMouseTimer: number | undefined;
  forceMouseHide = false;

  @HostListener('document:mousemove', ['$event'])
  onMouseMove() {
    if (this.forceMouseHide) {
      return;
    }

    document.body.style.cursor = '';

    clearTimeout(this.idleMouseTimer);

    this.idleMouseTimer = setTimeout(() => {
      document.body.style.cursor = 'none';

      this.forceMouseHide = true;

      setTimeout(() => {
        this.forceMouseHide = false;
      }, 200);
    }, 1000);
  }
}
