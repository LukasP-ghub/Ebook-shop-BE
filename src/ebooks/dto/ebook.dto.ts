import { Expose, plainToInstance, Transform, Type } from "class-transformer";
import { ArrayMinSize, ArrayNotEmpty, IsAlpha, IsArray, IsDateString, IsNotEmpty, IsNotEmptyObject, IsNumber, IsObject, IsString, Max, MaxLength, Min, ValidateNested, ValidationError } from "class-validator";
import { CategoryDto } from "../../categories/dto/category.dto";
import { AuthorDto } from "../../authors/dto/author.dto";
import { tryJsonParse } from "../../utils/tryJsonParse";
import { CoverDto } from "./cover.dto";
import { EbookLanguageDto } from "./ebook_language.dto";
import { PublisherDto } from "./publisher.dto";
import { DiscountDto } from "../../discounts/dto/discount.dto";

export class EbookDto {
  @Expose()
  ebook_id: string;

  @Expose()
  @Type(() => CoverDto)
  cover: CoverDto;

  @Expose()
  @IsString()
  @IsAlpha()
  @IsNotEmpty()
  title: string;

  @Expose()
  @IsNumber({ maxDecimalPlaces: 0, allowNaN: false })
  @Min(1)
  pages: number;

  @Expose()
  @IsDateString()
  publication_date: string;

  @Expose()
  @IsString()
  description: string;

  @Expose()
  @IsNumber({ maxDecimalPlaces: 2, allowNaN: false })
  @Min(0)
  @Max(999)
  price: number;

  @Expose()
  @IsString()
  @IsNotEmpty()
  language_code: string;

  @Expose()
  @IsString()
  @IsNotEmpty()
  language_name: string;

  // @Expose()
  // @IsNotEmpty()
  // @IsNotEmptyObject()
  // @Transform(({ value }) => plainToInstance(EbookLanguageDto, tryJsonParse(value), { enableImplicitConversion: true, excludeExtraneousValues: true, exposeUnsetFields: false }))
  // @ValidateNested()
  // @Type(() => EbookLanguageDto)
  // language: EbookLanguageDto;

  @Expose()
  @IsNotEmpty()
  @IsNotEmptyObject()
  @Transform(({ value }) => plainToInstance(PublisherDto, tryJsonParse(value), { enableImplicitConversion: true, excludeExtraneousValues: true, exposeUnsetFields: false }))
  @ValidateNested()
  @Type(() => PublisherDto)
  publisher: PublisherDto;

  @Expose()
  @Transform(({ value }) => plainToInstance(AuthorDto, tryJsonParse(value), { enableImplicitConversion: true, excludeExtraneousValues: true, exposeUnsetFields: false }))
  @IsArray()
  @IsObject({ each: true })
  @ArrayMinSize(1)
  @ArrayNotEmpty()
  @ValidateNested({ each: true })
  @Type(() => AuthorDto)
  author: AuthorDto[];

  @Expose()
  @Transform(({ value }) => plainToInstance(CategoryDto, tryJsonParse(value), { enableImplicitConversion: true, excludeExtraneousValues: true, exposeUnsetFields: false }))
  @IsArray()
  @IsObject({ each: true })
  @ArrayMinSize(1)
  @ArrayNotEmpty()
  @ValidateNested({ each: true })
  @Type(() => CategoryDto)
  category: CategoryDto[];

  @Expose()
  @Transform(({ value }) => plainToInstance(DiscountDto, tryJsonParse(value), { enableImplicitConversion: true, excludeExtraneousValues: true, exposeUnsetFields: false }))
  @IsArray()
  @IsObject({ each: true })
  @ArrayMinSize(1)
  @ArrayNotEmpty()
  @ValidateNested({ each: true })
  @Type(() => DiscountDto)
  discount: DiscountDto[];
}