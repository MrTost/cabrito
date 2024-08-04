import { Component, Inject } from '@angular/core';
import { MAT_SNACK_BAR_DATA } from '@angular/material/snack-bar';
import { EpgChannel } from '../../../../core/models/epg-channel';

@Component({
  selector: 'app-live-snackbar',
  standalone: true,
  imports: [],
  templateUrl: './live-snackbar.component.html',
  styleUrl: './live-snackbar.component.scss',
})
export class LiveSnackbarComponent {
  constructor(@Inject(MAT_SNACK_BAR_DATA) public data: EpgChannel) {}
}
