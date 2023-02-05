import { Expose } from "class-transformer";


export class EbookLanguageDto {
  @Expose()
  language_id: string;

  @Expose()
  language_name: string

  @Expose()
  language_code: string;
}