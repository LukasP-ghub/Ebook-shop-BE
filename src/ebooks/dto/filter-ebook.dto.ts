import { EbookDBSearchKey } from "../../types";

export class FilterEbookDto {
  key?: EbookDBSearchKey;
  phrase?: string;
  maxPrice?: number;
  minPrice?: number;
}