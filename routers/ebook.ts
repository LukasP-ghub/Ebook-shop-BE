import { Router } from "express";
import { getAll, getMany, getOne } from "../controllers/ebook.controller";
import { EbookRecord } from "../records/ebook.record";
import { EbookDBSearchKey, EbookDBSearchOptions, ListEbooksRes } from "../types";
import { ValidationError } from "../utils/errors";

export const ebookRouter = Router();

ebookRouter // /ebooks

    .get('/', getAll)

    .get('/get-many', getMany)

    .get('/get-one', getOne)