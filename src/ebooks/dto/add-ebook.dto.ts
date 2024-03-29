import { ArrayMinSize, ArrayNotEmpty, IsArray, IsNotEmpty, IsString } from "class-validator";
import { EbookDto } from "./ebook.dto";
import { OmitType } from "@nestjs/mapped-types";
import { Expose, Transform } from "class-transformer";
import { tryJsonParse } from "../../utils/tryJsonParse";


export class AddEbookDto extends OmitType(EbookDto, ['author', 'discount', 'publisher', 'category', 'ebook_id', 'cover']) {
  @Expose()
  @IsArray()
  @ArrayMinSize(1)
  @ArrayNotEmpty()
  @Transform(({ value }) => tryJsonParse(value))
  author: string[];

  @Expose()
  @IsArray()
  @Transform(({ value }) => tryJsonParse(value))
  discount: string[];

  // @Expose()
  // @IsNotEmpty()
  // @IsString()
  // language: string;

  @Expose()
  @IsNotEmpty()
  @IsString()
  publisher: string;

  @Expose()
  @IsArray()
  @ArrayMinSize(1)
  @ArrayNotEmpty()
  @Transform(({ value }) => tryJsonParse(value))
  category: string[];
}
