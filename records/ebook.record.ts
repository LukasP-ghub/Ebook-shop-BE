import { pool } from "../utils/db";
import { ValidationError } from "../utils/errors";
import { v4 as uuid } from "uuid";
import { FieldPacket } from "mysql2";
import { Author, Ebook, EbookEntity } from "../types/ebook/ebook.entity";
import { normalizeEbookDBRes } from "../utils/normalizeEbookDBRes";
import { EbookDBSearchKey, EbookDBSearchOptions, EbookGroupOptions } from "../types";

type EbookEntityResults = [EbookEntity[], FieldPacket[]];

export class EbookRecord implements Ebook {
    public ebook_id?: string;
    public author: Author;
    public title: string;
    public num_pages: number;
    public publication_date: Date | string;
    public description: string;
    public price: number;
    public publisher_name: string;
    public language_code: string;
    public language_name: string;
    public category: string[];

    constructor(obj: Ebook) {
        if (!obj.title || obj.title.length > 100) {
            throw new ValidationError('Tytuł musi mieć od 1 do 100 znaków.');
        }

        if (!obj.num_pages || obj.num_pages > 9999) {
            throw new ValidationError('Liczna stron musi mieć więcej niż 1 i mniej niż 9999.');
        }

        if (!obj.publication_date) {
            throw new ValidationError('Niepoprawna data.');
        }

        this.ebook_id = obj.ebook_id;
        this.author = obj.author;
        this.title = obj.title;
        this.num_pages = obj.num_pages;
        this.publication_date = obj.publication_date;
        this.description = obj.description;
        this.price = obj.price;
        this.publisher_name = obj.publisher_name;
        this.language_code = obj.language_code;
        this.language_name = obj.language_name;
        this.category = obj.category;
    }

    //STATICS

    static async getMany(): Promise<EbookRecord[]> {
        const [results] = (await pool.execute(`SELECT ebook_author.ebook_id, ebook_author.author_id, ebook.title, ebook.num_pages, ebook.publication_date, ebook.description, ebook.price, author.author_name, publisher.publisher_name, ebook_language.language_code, ebook_language.language_name, category.category_name
        FROM ebook_author 
        INNER JOIN ebook ON ebook_author.ebook_id=ebook.ebook_id
        INNER JOIN author ON ebook_author.author_id=author.author_id 
        INNER JOIN publisher ON ebook.publisher_id=publisher.publisher_id 
        INNER JOIN ebook_language ON ebook.language_id=ebook_language.language_id 
        INNER JOIN ebook_category ON ebook_category.ebook_id=ebook_author.ebook_id
        INNER JOIN category ON category.category_id = ebook_category.category_id
        ;`)) as EbookEntityResults;

        return normalizeEbookDBRes(results).map(obj => new EbookRecord(obj));
    }

    static async getManyBy({ key = EbookDBSearchKey.title, phrase = '', maxPrice = 999, minPrice = 0, }: EbookDBSearchOptions): Promise<EbookRecord[]> {
        const [results] = (await pool.execute(`SELECT ebook_author.ebook_id, ebook_author.author_id, ebook.title, ebook.num_pages, ebook.publication_date, ebook.description, ebook.price, author.author_name, publisher.publisher_name, ebook_language.language_code, ebook_language.language_name, category.category_name
        FROM ebook_author 
        INNER JOIN ebook ON ebook_author.ebook_id=ebook.ebook_id ${key === EbookDBSearchKey.title ? `AND ebook.title LIKE CONCAT( '%',:phrase,'%')` : ''} AND ebook.price <= :maxPrice AND ebook.price >= :minPrice
        INNER JOIN author ON ebook_author.author_id=author.author_id ${key === EbookDBSearchKey.author_id ? `AND author.author_id = :phrase'` : key === EbookDBSearchKey.author_name ? `AND author.author_name LIKE CONCAT( '%',:phrase,'%')` : ''}
        INNER JOIN publisher ON ebook.publisher_id=publisher.publisher_id 
        INNER JOIN ebook_language ON ebook.language_id=ebook_language.language_id 
        INNER JOIN ebook_category ON ebook_category.ebook_id=ebook_author.ebook_id
        INNER JOIN category ON category.category_id = ebook_category.category_id
        ;`,
            {
                phrase,
                maxPrice,
                minPrice,
            }
        )) as EbookEntityResults;

        return normalizeEbookDBRes(results).map(obj => new EbookRecord(obj));
    }

    static async getOneById(id: string): Promise<EbookRecord | null> {
        const [results] = await pool.execute(
            `SELECT ebook_author.ebook_id, ebook_author.author_id, ebook.title, ebook.num_pages, ebook.publication_date, ebook.description, ebook.price, author.author_name,    publisher.publisher_name, ebook_language.language_code, ebook_language.language_name, category.category_name
            FROM ebook_author 
            INNER JOIN ebook ON ebook_author.ebook_id=ebook.ebook_id AND ebook_author.ebook_id = :id 
            INNER JOIN author ON ebook_author.author_id=author.author_id 
            INNER JOIN publisher ON ebook.publisher_id=publisher.publisher_id 
            INNER JOIN ebook_language ON ebook.language_id=ebook_language.language_id 
            INNER JOIN ebook_category ON ebook_category.ebook_id=ebook_author.ebook_id
            INNER JOIN category ON category.category_id = ebook_category.category_id
            ;`,
            {
                id,
            }
        ) as EbookEntityResults;

        return results.length === 0 ? null : normalizeEbookDBRes(results).map(obj => new EbookRecord(obj))[0];
    }
}
