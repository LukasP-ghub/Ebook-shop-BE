import { Exclude, Expose, Transform, Type } from "class-transformer";
import { CategoryDto } from "../../categories/dto/category.dto";
import { AuthorDto } from "../../authors/dto/author.dto";
import { EbookLanguageDto } from "./ebook-language.dto";
import { PublisherDto } from "./publisher.dto";
import { DiscountDto } from "../../discounts/dto/discount.dto";
import { CoverDto } from "./cover.dto";

@Exclude()
export class EbookDto {
  @Expose()
  ebook_id: string;

  @Expose()
  title: string;

  @Expose()
  pages: number;

  @Expose()
  publication_date: string;

  @Expose()
  description: string;

  @Expose()
  price: number;

  @Expose()
  @Type(() => CoverDto)
  cover: CoverDto;

  @Expose()
  @Type(() => EbookLanguageDto)
  language: EbookLanguageDto;

  @Expose()
  @Type(() => PublisherDto)
  publisher: PublisherDto;

  @Expose()
  @Type(() => AuthorDto)
  author: AuthorDto[];

  @Expose()
  @Type(() => CategoryDto)
  category: CategoryDto[];

  @Expose()
  @Type(() => DiscountDto)
  discount: DiscountDto[];
}