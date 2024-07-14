import {
  booleanAttribute,
  Component,
  ElementRef,
  Input,
  OnChanges,
  OnDestroy,
  SimpleChanges,
  ViewChild,
} from '@angular/core';
import Hls from 'hls.js';

@Component({
  selector: 'app-video-player',
  standalone: true,
  imports: [],
  templateUrl: './video-player.component.html',
  styleUrl: './video-player.component.scss',
})
export class VideoPlayerComponent implements OnChanges, OnDestroy {
  @ViewChild('target', { static: true }) target!: ElementRef<HTMLMediaElement>;

  @Input()
  class = '';

  @Input({ required: true })
  src!: string;

  @Input({ required: true })
  type!: string;

  @Input({ transform: booleanAttribute })
  autoplay = false;

  private hls: Hls | undefined;

  constructor(private elementRef: ElementRef) {}

  ngOnChanges(changes: SimpleChanges): void {
    const src = changes['src']?.currentValue ?? this.src;

    const video = this.target.nativeElement;

    if (Hls.isSupported()) {
      if (this.hls) {
        this.hls.destroy();
      }

      this.hls = new Hls();
      this.hls.loadSource(src);
      this.hls.attachMedia(video);
    } else if (video.canPlayType('application/vnd.apple.mpegurl')) {
      video.src = src;
    }

    video.play().then();
  }

  ngOnDestroy() {
    if (this.hls) {
      this.hls.destroy();
    }
  }
}
