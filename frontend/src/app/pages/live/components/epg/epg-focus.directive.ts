import { Directive, ElementRef, Input } from '@angular/core';

@Directive({
  selector: '[appEpgFocus]',
  standalone: true,
})
export class EpgFocusDirective {
  @Input()
  set appEpgFocus(value: boolean) {
    if (value) {
      this.elementRef.nativeElement.scrollIntoView({ block: 'center' });
    }
  }

  constructor(private elementRef: ElementRef) {}
}
