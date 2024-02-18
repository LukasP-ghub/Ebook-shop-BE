import { Expose } from "class-transformer";
import { IsEnum, IsNumber, IsOptional, IsString, Max, Min } from "class-validator";
import { EbookDBSearchKey } from "../../types";

export class FilterEbookDto {
  @Expose()
  @IsEnum(EbookDBSearchKey)
  @IsOptional()
  key: EbookDBSearchKey = EbookDBSearchKey.title;

  @Expose()
  @IsOptional()
  @IsString()
  phrase: string;

  @Expose()
  @IsOptional()
  @IsNumber({ maxDecimalPlaces: 2, allowNaN: false })
  @Min(0)
  @Max(999)
  maxPrice: number = 999;

  @Expose()
  @IsOptional()
  @IsNumber({ maxDecimalPlaces: 2, allowNaN: false })
  @Min(0)
  @Max(999)
  minPrice: number = 0;
}