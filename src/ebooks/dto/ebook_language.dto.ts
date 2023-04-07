import { Expose } from "class-transformer";
import { IsOptional, IsString, IsUUID } from "class-validator";


export class EbookLanguageDto {
  @Expose()
  @IsOptional()
  @IsUUID()
  language_id: string;

  @Expose()
  @IsString()
  language_name: string

  @Expose()
  @IsString()
  language_code: string;
}