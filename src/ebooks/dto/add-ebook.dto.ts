import { Expose, instanceToInstance, plainToInstance, Transform, TransformPlainToInstance, Type } from "class-transformer";
import { ArrayMinSize, ArrayNotEmpty, IsAlpha, IsArray, IsNotEmpty, IsNotEmptyObject, IsNumber, IsObject, IsString, Max, MaxLength, Min, ValidateNested, ValidationError } from "class-validator";
import { CategoryDto } from "../../categories/dto/category.dto";
import { AuthorDto } from "../../authors/dto/author.dto";
import { tryJsonParse } from "../../utils/tryJsonParse";
import { CoverDto } from "./cover.dto";
import { EbookLanguageDto } from "./ebook-language.dto";
import { EbookDto } from "./ebook.dto";
import { PublisherDto } from "./publisher.dto";
import { DiscountDto } from "../../discounts/dto/discount.dto";

export class AddEbookDto {
  @Expose()
  @IsString()
  @IsAlpha()
  title: string;

  @Expose()
  @IsNumber({ maxDecimalPlaces: 0, allowNaN: false })
  @Min(1)
  pages: number;

  @Expose()
  @IsString()
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
  @IsNotEmpty()
  @IsNotEmptyObject()
  @Transform(({ value }) => tryJsonParse(value))
  @ValidateNested()
  @Type(() => EbookLanguageDto)
  language: EbookLanguageDto;

  @Expose()
  @IsNotEmpty()
  @IsNotEmptyObject()
  @Transform(({ value }) => tryJsonParse(value))
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
