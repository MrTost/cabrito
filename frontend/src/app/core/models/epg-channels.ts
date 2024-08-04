import { EpgChannel } from './epg-channel';

export interface EpgChannels {
  type: 'channels';
  items: EpgChannel[];
}
