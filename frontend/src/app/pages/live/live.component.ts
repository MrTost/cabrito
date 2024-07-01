import { Component, HostListener, OnDestroy, OnInit } from '@angular/core';
import { MatBottomSheet, MatBottomSheetRef } from '@angular/material/bottom-sheet';
import { Subscription } from 'rxjs';
import { MatSnackBar, MatSnackBarHorizontalPosition, MatSnackBarVerticalPosition } from '@angular/material/snack-bar';
import { EpgComponent } from './components/epg/epg.component';
import { LiveService } from './live.service';
import { VideoPlayerComponent } from '../../core/components/video-player/video-player.component';
import { AsyncPipe } from '@angular/common';

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

  private readonly channelSelectedSub: Subscription | undefined;

  constructor(
    public liveService: LiveService,
    private bottomSheet: MatBottomSheet,
    private snackBar: MatSnackBar,
  ) {
    const horizontalPosition: MatSnackBarHorizontalPosition = 'end';
    const verticalPosition: MatSnackBarVerticalPosition = 'top';

    this.channelSelectedSub = this.liveService.channelSelected.subscribe((channel) => {
      if (channel) {
        const msg = `${channel.channelId} - ${channel.channelName}`;

        this.snackBar.open(msg, undefined, {
          horizontalPosition: horizontalPosition,
          verticalPosition: verticalPosition,
          duration: 2000,
        });
      }
    });
  }

  ngOnInit(): void {
    this.liveService.loadChannels();
    this.openBottomSheet();
  }

  ngOnDestroy(): void {
    if (this.channelSelectedSub) {
      this.channelSelectedSub.unsubscribe();
    }
  }

  @HostListener('window:keydown.enter', ['$event'])
  onKeyPressEnter(event: KeyboardEvent) {
    console.log('window:keydown.enter pressed');
    if (this.bottomSheetRef) {
      console.log('close');
      this.bottomSheetRef.dismiss();
      this.bottomSheetRef = undefined;
    } else {
      console.log('open');
      this.openBottomSheet();
    }
  }

  @HostListener('window:keydown.ArrowUp', ['$event'])
  onArrowUp(event: KeyboardEvent) {
    if (!this.bottomSheetRef) {
      this.liveService.selectChannel('up');
    }
  }

  @HostListener('window:keydown.ArrowDown', ['$event'])
  onArrowDown(event: KeyboardEvent) {
    if (!this.bottomSheetRef) {
      this.liveService.selectChannel('down');
    }
  }

  openBottomSheet(): void {
    this.bottomSheetRef = this.bottomSheet.open(EpgComponent, {
      panelClass: 'epg-bottom-sheet-container',
    });
  }
}
