import { Routes } from '@angular/router';
import { LiveComponent } from './pages/live/live.component';

export const routes: Routes = [
  {
    path: 'live',
    component: LiveComponent,
    title: 'Live',
  },
  { path: '', redirectTo: '/live', pathMatch: 'full' },
];
