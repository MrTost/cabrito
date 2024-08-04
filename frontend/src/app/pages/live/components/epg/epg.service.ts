import { Injectable } from '@angular/core';
import { BehaviorSubject, distinctUntilChanged, combineLatest, map } from 'rxjs';
import { EpgCursor } from '../../../../core/models/epg-cursor';
import { EpgCategory } from '../../../../core/models/epg-category';
import { HttpClient, HttpParams } from '@angular/common/http';
import { EpgChannel } from '../../../../core/models/epg-channel';

@Injectable({
  providedIn: 'root',
})
export class EpgService {
  private visibleSub: BehaviorSubject<boolean> = new BehaviorSubject<boolean>(true);
  visible = this.visibleSub.asObservable().pipe(distinctUntilChanged());

  private categoriesSub: BehaviorSubject<EpgCategory[]> = new BehaviorSubject<EpgCategory[]>([]);
  categories = this.categoriesSub.asObservable().pipe(distinctUntilChanged());

  private channelsSub: BehaviorSubject<EpgChannel[]> = new BehaviorSubject<EpgChannel[]>([]);
  channels = this.channelsSub.asObservable().pipe(distinctUntilChanged());

  private cursorSub: BehaviorSubject<EpgCursor> = new BehaviorSubject<EpgCursor>({ col: 1, row: [0, 0] });
  cursor = this.cursorSub.asObservable().pipe(distinctUntilChanged());

  private selectionSub: BehaviorSubject<Map<number, number>> = new BehaviorSubject<Map<number, number>>(
    new Map<number, number>([[0, 0]]),
  );
  selection = this.selectionSub.asObservable().pipe(distinctUntilChanged());

  categorySelected = combineLatest([this.categoriesSub, this.selectionSub]).pipe(
    map(([categories, selection]) => {
      const index = selection.get(0);
      return index !== undefined ? categories[index] : undefined;
    }),
    distinctUntilChanged(),
  );

  channelSelected = combineLatest([this.channelsSub, this.selectionSub]).pipe(
    map(([channels, selection]) => {
      const index = selection.get(1);
      return index !== undefined ? channels[index] : undefined;
    }),
    distinctUntilChanged(),
  );

  constructor(private http: HttpClient) {
    this.loadCategories();
  }

  loadCategories() {
    this.http.get<EpgCategory[]>('/api/live/epg/category').subscribe((categories) => {
      this.categoriesSub.next(categories);
    });
  }

  loadChannels(category: EpgCategory | undefined) {
    const options = { params: new HttpParams().set('categoryId', category?.id || 'all') };

    this.http.get<EpgChannel[]>('/api/live/epg', options).subscribe((channels) => {
      this.channelsSub.next(channels);

      // reset cursor
      const cursor = this.cursorSub.value;
      cursor.row[1] = 0;
      this.cursorSub.next(cursor);
    });
  }

  cursorUp() {
    const cursor = this.cursorSub.value;
    cursor.row[cursor.col] -= 1;

    const max = cursor.col === 0 ? this.categoriesSub.value.length : this.channelsSub.value.length;

    if (cursor.row[cursor.col] < 0) {
      cursor.row[cursor.col] = max - 1;
    }

    this.cursorSub.next(cursor);
  }

  cursorDown() {
    const cursor = this.cursorSub.value;
    cursor.row[cursor.col] += 1;

    const max = cursor.col === 0 ? this.categoriesSub.value.length : this.channelsSub.value.length;

    if (cursor.row[cursor.col] > max - 1) {
      cursor.row[cursor.col] = 0;
    }

    this.cursorSub.next(cursor);
  }

  cursorLeft() {
    const cursor = this.cursorSub.value;
    cursor.col -= 1;

    if (cursor.col < 0) {
      cursor.col = 0;
    }

    this.cursorSub.next(cursor);
  }

  cursorRight() {
    const cursor = this.cursorSub.value;

    if (cursor.col === 0) {
      const selection = this.selectionSub.value;
      cursor.row[0] = selection.get(0) ?? 0;
    }

    cursor.col += 1;

    const max = 1;

    if (cursor.col > max) {
      cursor.col = max;
    }

    this.cursorSub.next(cursor);
  }

  cursorSelect() {
    const cursor = this.cursorSub.value;
    const selection = this.selectionSub.value;

    selection.set(cursor.col, cursor.row[cursor.col]);

    this.selectionSub.next(selection);

    if (cursor.col !== 0) {
      this.setVisible(false);
    }
  }

  setVisible(visible: boolean) {
    this.visibleSub.next(visible);
  }

  selectChannel(direction: 'up' | 'down') {
    // TODO - emit only one event

    const cursor = this.cursorSub.value;
    cursor.col = 1;
    this.cursorSub.next(cursor);

    if (direction === 'up') {
      this.cursorUp();
    } else {
      this.cursorDown();
    }

    this.cursorSelect();
  }
}
