export interface ApiPage<T> {
  prev?: string;
  next?: string;
  items: T[];
}
