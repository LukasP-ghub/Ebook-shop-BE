import { EbookRecord } from "../../records/ebook.record";

export interface ListEbooksRes {
    ebooksList: EbookRecord[];
}

export enum EbookGroupOptions {
    ebook_id,
    author_id,
}

export enum EbookDBSearchKey {
    title = 'title',
    author_id = 'author_id',
    author_name = 'author_name',
}

export interface EbookDBSearchOptions {
    key?: EbookDBSearchKey,
    phrase?: string,
    maxPrice?: number,
    minPrice?: number,
}