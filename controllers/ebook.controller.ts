import { Request, Response } from "express";
import { EbookRecord } from "../records/ebook.record";
import { EbookDBSearchKey, EbookDBSearchOptions, ListEbooksRes } from "../types";
import { ValidationError } from "../utils/errors";
import asyncHandler from "express-async-handler";

export const getAll = asyncHandler(async (req: Request, res: Response) => {
  const ebookList = await EbookRecord.getMany();

  res.json({
    ebookList,
  });
})

export const getMany = asyncHandler(async (req: Request, res: Response) => {
  const { query } = req;
  const allowedSearchKeys: string[] = Object.values(EbookDBSearchKey);
  if (query?.key && !allowedSearchKeys.includes(`${query?.key}`)) throw new ValidationError('Niepoprawny klucz wyszukiwania');

  const searchOptions: EbookDBSearchOptions = req.query;

  const ebookList = await EbookRecord.getManyBy(searchOptions);

  res.json({
    ebookList,
  });
})

export const getOne = asyncHandler(async (req: Request, res: Response) => {
  const ebook_id = `${req.query?.ebook_id}`;
  const ebook = await EbookRecord.getOneById(ebook_id);

  res.json({
    ebook,
  });
})