import { EpgCategory } from './epg-category';

export interface EpgCategories {
  type: 'categories';
  items: EpgCategory[];
}
