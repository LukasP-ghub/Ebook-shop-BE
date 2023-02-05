import { Transform } from "class-transformer";
import { IsEnum, IsNumber, IsOptional, IsString, Max, Min } from "class-validator";
import { EbookDBSearchKey } from "../../types";

export class FilterEbookDto {

  @IsEnum(EbookDBSearchKey)
  @IsOptional()
  key: EbookDBSearchKey = EbookDBSearchKey.title;

  @IsOptional()
  @IsString()
  phrase: string;

  @Transform(({ value }) => parseInt(value))
  @IsOptional()
  @IsNumber()
  @Min(0)
  @Max(999)
  maxPrice: number = 999;

  @Transform(({ value }) => parseInt(value))
  @IsOptional()
  @IsNumber()
  @Min(0)
  @Max(999)
  minPrice: number = 0;
}