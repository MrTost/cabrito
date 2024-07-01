import { Component, HostListener, OnDestroy, OnInit } from '@angular/core';
import { Subscription } from 'rxjs';
import { MatBottomSheetRef } from '@angular/material/bottom-sheet';
import { LiveService } from '../../live.service';
import { MatChipListbox, MatChipOption } from '@angular/material/chips';
import { AsyncPipe } from '@angular/common';
import { MatRipple } from '@angular/material/core';
import { EpgFocusDirective } from './epg-focus.directive';

@Component({
  selector: 'app-epg',
  standalone: true,
  imports: [MatChipListbox, MatChipOption, AsyncPipe, MatRipple, EpgFocusDirective],
  templateUrl: './epg.component.html',
  styleUrl: './epg.component.scss',
})
export class EpgComponent implements OnInit, OnDestroy {
  public cursorChannels = 0;
  private cursorChannelsSub: Subscription | undefined;

  public categories = [
    { id: 'auto', name: 'Auto', icon: '' },
    { id: 'animation', name: 'Animation', icon: '' },
    { id: 'business', name: 'Business', icon: '' },
    { id: 'classic', name: 'Classic', icon: '' },
    { id: 'comedy', name: 'Comedy', icon: '' },
    { id: 'cooking', name: 'Cooking', icon: '' },
    { id: 'culture', name: 'Culture', icon: '' },
    { id: 'documentary', name: 'Documentary', icon: '' },
    { id: 'education', name: 'Education', icon: '' },
    { id: 'entertainment', name: 'Entertainment', icon: '' },
    { id: 'family', name: 'Family', icon: '' },
    { id: 'general', name: 'General', icon: '' },
    { id: 'kids', name: 'Kids', icon: '' },
    { id: 'legislative', name: 'Legislative', icon: '' },
    { id: 'lifestyle', name: 'Lifestyle', icon: '' },
    { id: 'movies', name: 'Movies', icon: '' },
    { id: 'music', name: 'Music', icon: '' },
    { id: 'news', name: 'News', icon: '' },
    { id: 'outdoor', name: 'Outdoor', icon: '' },
    { id: 'relax', name: 'Relax', icon: '' },
    { id: 'religious', name: 'Religious', icon: '' },
    { id: 'series', name: 'Series', icon: '' },
    { id: 'science', name: 'Science', icon: '' },
    { id: 'shop', name: 'Shop', icon: '' },
    { id: 'sports', name: 'Sports', icon: '' },
    { id: 'travel', name: 'Travel', icon: '' },
    { id: 'weather', name: 'Weather', icon: '' },
    { id: 'xxx', name: 'XXX', icon: '' },
  ];

  constructor(
    private _bottomSheetRef: MatBottomSheetRef<EpgComponent>,
    public liveService: LiveService,
  ) {}

  ngOnInit(): void {
    this.cursorChannelsSub = this.liveService.cursorChannels.subscribe((position) => {
      this.cursorChannels = position;
    });
  }

  @HostListener('window:keydown.ArrowUp', ['$event'])
  onArrowUp(event: KeyboardEvent) {
    console.log('window:keydown.ArrowUp pressed');
    this.liveService.cursorChannelUp();
  }

  @HostListener('window:keydown.ArrowDown', ['$event'])
  onArrowDown(event: KeyboardEvent) {
    console.log('window:keydown.ArrowDown pressed');
    this.liveService.cursorChannelDown();
  }

  @HostListener('window:keydown.enter', ['$event'])
  onKeyPressEnter(event: KeyboardEvent) {
    console.log('window:keydown.enter pressed');
    this.liveService.selectChannelCursor();
  }

  ngOnDestroy(): void {
    this.cursorChannelsSub?.unsubscribe();
  }

  openLink(event: MouseEvent): void {
    this._bottomSheetRef.dismiss();
    event.preventDefault();
  }
}
