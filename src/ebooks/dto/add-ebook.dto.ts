import { IsNumber, IsString, MaxLength } from "class-validator";

export class AddEbookDto {
  @IsString()
  title: string;

  @IsNumber()
  pages: number;

  @IsString()
  publication_date: string;

  @IsString()
  description: string;

  @IsNumber()
  price: number;

  // @IsString()
  // cover: string;

  @IsString()
  language_id: string;

  @IsString()
  publisher_id: string;

  @MaxLength(100, {
    each: true,
  })
  author: string[];

  @MaxLength(30, {
    each: true,
  })
  category: string[];

  @MaxLength(5, {
    each: true,
  })
  discount: string[];

}
