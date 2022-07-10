import { Router } from "express";
import { EbookRecord } from "../records/ebook.record";
import { EbookDBSearchKey, EbookDBSearchOptions, ListEbooksRes } from "../types";
import { ValidationError } from "../utils/errors";

export const ebookRouter = Router();

ebookRouter // /ebooks

    .get('/', async (req, res) => {
        const ebookList = await EbookRecord.getMany();

        res.json({
            ebookList,
        });
    })

    .get('/get-many', async (req, res) => {
        const { query } = req;
        const allowedSearchKeys: string[] = Object.values(EbookDBSearchKey);
        if (query?.key && !allowedSearchKeys.includes(`${query?.key}`)) throw new ValidationError('Niepoprawny klucz wyszukiwania');

        const searchOptions: EbookDBSearchOptions = req.query;

        const ebookList = await EbookRecord.getManyBy(searchOptions);

        res.json({
            ebookList,
        });
    }
    )

    .get('/get-one', async (req, res) => {
        const ebook_id = `${req.query?.ebook_id}`;
        const ebook = await EbookRecord.getOneById(ebook_id);

        res.json({
            ebook,
        });
    })