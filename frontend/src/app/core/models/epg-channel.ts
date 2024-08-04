export interface EpgChannel {
  channelId: string;
  channelName: string;
  countryId: string;
  countryFlag: string;
  isClosed: boolean;
  categories: string[];
  scanStatus: string[];
}
