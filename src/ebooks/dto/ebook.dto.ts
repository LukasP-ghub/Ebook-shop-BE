import { Exclude, Expose, Transform, Type } from "class-transformer";
import { CategoryDto } from "../../categories/dto/category.dto";
import { AuthorDto } from "../../authors/dto/author.dto";
import { EbookLanguageDto } from "./ebook-language.dto";
import { PublisherDto } from "./publisher.dto";
import { DiscountDto } from "../../discounts/dto/discount.dto";

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
  cover: string;

  @Expose()
  @Type(() => EbookLanguageDto)
  language_id: EbookLanguageDto;

  @Expose()
  @Type(() => PublisherDto)
  publisher_id: PublisherDto;

  @Expose()
  @Type(() => AuthorDto)
  //@Transform(({ value }) => value.map((item) => item.author_name))
  author: AuthorDto[];

  @Expose()
  @Type(() => CategoryDto)
  category: CategoryDto[];

  @Expose()
  @Type(() => DiscountDto)
  discount: DiscountDto[];
}

//@Transform(({ obj }) => obj.language_name)