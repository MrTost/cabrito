import { Routes } from '@angular/router';
import { LiveComponent } from './pages/live/live.component';
import { ChannelComponent } from './pages/admin/channel/channel.component';

export const routes: Routes = [
  {
    path: 'live',
    component: LiveComponent,
    title: 'Live',
  },
  {
    path: 'admin',
    children: [{ path: 'channel', component: ChannelComponent, title: 'Channel' }],
  },
  { path: '', redirectTo: '/live', pathMatch: 'full' },
];
