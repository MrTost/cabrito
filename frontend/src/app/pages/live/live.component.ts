import { Component, HostListener, OnDestroy, OnInit } from '@angular/core';
import { MatBottomSheet, MatBottomSheetRef } from '@angular/material/bottom-sheet';
import { Subscription } from 'rxjs';
import { MatSnackBar, MatSnackBarHorizontalPosition, MatSnackBarVerticalPosition } from '@angular/material/snack-bar';
import { EpgComponent } from './components/epg/epg.component';
import { VideoPlayerComponent } from '../../core/components/video-player/video-player.component';
import { AsyncPipe } from '@angular/common';
import { EpgService } from './components/epg/epg.service';
import { EpgChannel } from '../../core/models/epg-channel';
import { LiveSnackbarComponent } from './components/live-snackbar/live-snackbar.component';

@Component({
  selector: 'app-live',
  standalone: true,
  imports: [VideoPlayerComponent, EpgComponent, AsyncPipe],
  templateUrl: './live.component.html',
  styleUrl: './live.component.scss',
})
export class LiveComponent implements OnInit, OnDestroy {
  private bottomSheetRef: MatBottomSheetRef | undefined;

  // handler of the keyup event
  // @HostListener('window:keydown', ['$event'])
  // onKeyUp(event: KeyboardEvent): void {
  //   console.log('window:keydown: ', `${event.key} - ${event.code}`);
  //
  //   // let keysToIgnore: string[] = ['PrintScreen', 'Escape', 'cControl', 'NumLock', 'PageUp', 'PageDown', 'End',
  //   //   'Home', 'Delete', 'Insert', 'ContextMenu', 'Control', 'ControlAltGraph', 'Alt', 'Meta', 'Shift', 'CapsLock',
  //   //   'TabTab', 'ArrowRight', 'ArrowLeft', 'ArrowDown', 'ArrowUp', 'Pause', 'ScrollLock', 'Dead', '',
  //   //   'F1', 'F2', 'F3', 'F4', 'F5', 'F6', 'F7', 'F8', 'F9', 'F10', 'F11', 'F12'];
  //   //
  //   // if(this.indexOfInArray(event.key, keysToIgnore) === -1) { // if it's not a special key
  //   //   if(event.key === 'Enter') {
  //   //     // some logic here
  //   //   } else {
  //   //     // some logic here
  //   //   }
  //   // }
  // }

  public channelSelected: EpgChannel | undefined;
  private channelSelectedSub: Subscription | undefined;

  private categorySelectedSub: Subscription | undefined;

  public epgVisible: boolean | undefined;
  private epgVisibleSub: Subscription | undefined;

  constructor(
    public epgService: EpgService,
    private bottomSheet: MatBottomSheet,
    private snackBar: MatSnackBar,
  ) {
    const horizontalPosition: MatSnackBarHorizontalPosition = 'end';
    const verticalPosition: MatSnackBarVerticalPosition = 'top';

    this.channelSelectedSub = this.epgService.channelSelected.subscribe((channel) => {
      this.channelSelected = channel;

      if (channel) {
        this.snackBar.openFromComponent(LiveSnackbarComponent, {
          horizontalPosition: horizontalPosition,
          verticalPosition: verticalPosition,
          duration: 2000,
          data: channel,
        });
      }
    });
  }

  ngOnInit(): void {
    this.epgVisibleSub = this.epgService.visible.subscribe((visible) => {
      this.epgVisible = visible;
      if (visible) {
        this.bottomSheetRef = this.openBottomSheet();
      } else {
        this.bottomSheetRef?.dismiss();
      }
    });

    this.categorySelectedSub = this.epgService.categorySelected.subscribe((category) => {
      this.epgService.loadChannels(category);
    });
  }

  ngOnDestroy(): void {
    this.channelSelectedSub?.unsubscribe();
    this.categorySelectedSub?.unsubscribe();
    this.epgVisibleSub?.unsubscribe();
  }

  @HostListener('window:keydown.enter', ['$event'])
  onKeyPressEnter(/*event: KeyboardEvent*/) {
    // console.log('window:keydown.enter pressed');

    if (this.epgVisible === false) {
      this.epgService.setVisible(true);
    }
  }

  @HostListener('window:keydown.ArrowUp', ['$event'])
  onArrowUp(/*event: KeyboardEvent*/) {
    if (this.epgVisible === false) {
      this.epgService.selectChannel('up');
    }
  }

  @HostListener('window:keydown.ArrowDown', ['$event'])
  onArrowDown(/*event: KeyboardEvent*/) {
    if (this.epgVisible === false) {
      this.epgService.selectChannel('down');
    }
  }

  private openBottomSheet() {
    const bottomSheetRef = this.bottomSheet.open(EpgComponent, {
      panelClass: 'epg-bottom-sheet-container',
    });

    bottomSheetRef.afterOpened().subscribe(() => {
      this.epgService.setVisible(true);
    });

    bottomSheetRef.afterDismissed().subscribe(() => {
      this.epgService.setVisible(false);
    });

    return bottomSheetRef;
  }
}
