import { Expose } from "class-transformer";
import { IsUUID } from "class-validator";


export class EbookLanguageDto {
  @Expose()
  @IsUUID()
  language_id: string;

  @Expose()
  language_name: string

  @Expose()
  language_code: string;
}