import {
  booleanAttribute,
  Component,
  ElementRef,
  Input,
  OnChanges,
  OnDestroy,
  OnInit,
  SimpleChanges,
  ViewChild,
} from '@angular/core';
import videojs from 'video.js';

@Component({
  selector: 'app-video-player',
  standalone: true,
  imports: [],
  templateUrl: './video-player.component.html',
  styleUrl: './video-player.component.scss',
})
export class VideoPlayerComponent implements OnInit, OnChanges, OnDestroy {
  @ViewChild('target', { static: true }) target!: ElementRef;

  @Input()
  class = '';

  @Input({ required: true })
  src!: string;

  @Input({ required: true })
  type!: string;

  @Input({ transform: booleanAttribute })
  autoplay = false;

  // @ts-expect-error video.js support to angular is fuzzy
  player: videojs.Player;

  constructor(private elementRef: ElementRef) {}

  // Instantiate a Video.js player OnInit
  ngOnInit() {
    // See options: https://videojs.com/guides/options
    const options = {
      autoplay: this.autoplay,
      sources: [
        {
          src: this.src,
          type: this.type,
        },
      ],
      controls: false,
    };

    const onPlayerReady = () => {
      console.log('onPlayerReady');
    };

    this.player = videojs(this.target.nativeElement, options, onPlayerReady);

    // videojs.hook('error', function(player: any, err: any) {
    //   console.log(`player ${player.id()} has errored out with code ${err.code} ${err.message}`);
    // });
  }

  ngOnChanges(changes: SimpleChanges): void {
    if (!changes['src'].firstChange) {
      const type = changes['type']?.currentValue ?? this.type;
      const src = changes['src']?.currentValue ?? this.src;

      this.player.src({ type: type, src: src });
    }
  }

  // Dispose the player OnDestroy
  ngOnDestroy() {
    if (this.player) {
      this.player.dispose();
    }
  }
}
