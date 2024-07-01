import { Injectable } from '@angular/core';
import { Channel } from '../../core/models/channel';
import { BehaviorSubject, combineLatest, distinctUntilChanged, first, map, Subject } from 'rxjs';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root',
})
export class LiveService {
  private channelSelectedSub: Subject<Channel | undefined> = new BehaviorSubject<Channel | undefined>(undefined);
  private channelsSub: Subject<Channel[]> = new BehaviorSubject<Channel[]>([]);
  private cursorChannelsSub: Subject<number> = new BehaviorSubject<number>(0);

  channels = this.channelsSub.asObservable().pipe(distinctUntilChanged());
  cursorChannels = this.cursorChannelsSub.asObservable().pipe(distinctUntilChanged());
  channelSelected = this.channelSelectedSub.asObservable().pipe(distinctUntilChanged());

  constructor(private http: HttpClient) {}

  loadChannels() {
    this.http.get<Channel[]>('/api/live/epg').subscribe((channels) => {
      this.channelsSub.next(channels);
    });
  }

  private moveCursor(direction: 'up' | 'down', current: number, min: number, max: number) {
    if (direction === 'up') {
      return current - 1 < min ? max - 1 : current - 1;
    }
    return current + 1 >= max ? min : current + 1;
  }

  cursorChannelUp() {
    combineLatest([this.channels, this.cursorChannels])
      .pipe(
        map(([channels, position]) => {
          return this.moveCursor('up', position, 0, channels.length);
        }),
        first(),
        distinctUntilChanged(),
      )
      .subscribe((position) => {
        this.cursorChannelsSub.next(position);
      });
  }

  cursorChannelDown() {
    combineLatest([this.channels, this.cursorChannels])
      .pipe(
        map(([channels, position]) => {
          return this.moveCursor('down', position, 0, channels.length);
        }),
        first(),
        distinctUntilChanged(),
      )
      .subscribe((position) => {
        this.cursorChannelsSub.next(position);
      });
  }

  selectChannelCursor() {
    combineLatest([this.channels, this.cursorChannels])
      .pipe(
        map(([channels, position]) => {
          return channels[position];
        }),
        first(),
        distinctUntilChanged(),
      )
      .subscribe((channel) => {
        this.channelSelectedSub.next(channel);
      });
  }

  setChannel(channel: Channel, index: number) {
    this.cursorChannelsSub.next(index);
    this.channelSelectedSub.next(channel);
  }

  selectChannel(direction: 'up' | 'down') {
    combineLatest([this.channels, this.cursorChannels])
      .pipe(
        map(([channels, position]) => {
          const newPosition = this.moveCursor(direction, position, 0, channels.length);
          return { channels, position: newPosition };
        }),
        first(),
        distinctUntilChanged(),
      )
      .subscribe(({ channels, position }) => {
        this.cursorChannelsSub.next(position);
        this.channelSelectedSub.next(channels[position]);
      });
  }
}
