import { Component, HostListener, OnDestroy, OnInit } from '@angular/core';
import { Subscription } from 'rxjs';
import { MatChipListbox, MatChipOption } from '@angular/material/chips';
import { AsyncPipe } from '@angular/common';
import { MatRippleModule } from '@angular/material/core';
import { EpgFocusDirective } from './epg-focus.directive';
import { MatListModule } from '@angular/material/list';
import { EpgService } from './epg.service';
import { EpgCursor } from '../../../../core/models/epg-cursor';

@Component({
  selector: 'app-epg',
  standalone: true,
  imports: [MatChipListbox, MatChipOption, AsyncPipe, MatRippleModule, EpgFocusDirective, MatListModule],
  templateUrl: './epg.component.html',
  styleUrl: './epg.component.scss',
})
export class EpgComponent implements OnInit, OnDestroy {
  public cursorChannels = 0;
  private cursorChannelsSub: Subscription | undefined;

  public cursor: EpgCursor | undefined;
  private cursorSub: Subscription | undefined;

  public selection: Map<number, number> = new Map<number, number>();
  private selectionSub: Subscription | undefined;

  constructor(public epgService: EpgService) {}

  ngOnInit(): void {
    this.cursorSub = this.epgService.cursor.subscribe((cursor) => {
      this.cursor = cursor;
    });

    this.selectionSub = this.epgService.selection.subscribe((selection) => {
      this.selection = selection;
    });
  }

  @HostListener('window:keydown.ArrowUp', ['$event'])
  onArrowUp(/*event: KeyboardEvent*/) {
    // console.log('window:keydown.ArrowUp pressed');
    this.epgService.cursorUp();
  }

  @HostListener('window:keydown.ArrowDown', ['$event'])
  onArrowDown(/*event: KeyboardEvent*/) {
    // console.log('window:keydown.ArrowDown pressed');
    this.epgService.cursorDown();
  }

  @HostListener('window:keydown.ArrowLeft', ['$event'])
  onArrowLeft(/*event: KeyboardEvent*/) {
    // console.log('window:keydown.ArrowLeft pressed');
    this.epgService.cursorLeft();
  }

  @HostListener('window:keydown.ArrowRight', ['$event'])
  onArrowRight(/*event: KeyboardEvent*/) {
    // console.log('window:keydown.ArrowRight pressed');
    this.epgService.cursorRight();
  }

  @HostListener('window:keydown.enter', ['$event'])
  onKeyPressEnter(/*event: KeyboardEvent*/) {
    // console.log('window:keydown.enter pressed');
    this.epgService.cursorSelect();
  }

  isCursorIn(col: number, row: number) {
    return this.cursor !== undefined && this.cursor.col === col && this.cursor.row[this.cursor.col] === row;
  }

  isSelected(col: number, row: number) {
    return this.selection.get(col) === row;
  }

  ngOnDestroy(): void {
    this.cursorChannelsSub?.unsubscribe();
    this.cursorSub?.unsubscribe();
    this.selectionSub?.unsubscribe();
  }
}
