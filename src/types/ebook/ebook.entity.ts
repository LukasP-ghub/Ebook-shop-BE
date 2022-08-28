export type Author = {
  id: string;
  name: string
}[];

interface EbookBaseData {
  ebook_id?: string;
  title: string;
  num_pages: number;
  publication_date: Date | string;
  description: string;
  price: number;
  publisher_name: string;
  language_code: string;
  language_name: string;
}

export interface EbookEntity extends EbookBaseData {
  author_id: string;
  author_name: string;
  category_name: string;
}

export interface Ebook extends EbookBaseData {
  author: Author;
  category: string[];
}

