import { Expose } from "class-transformer";
import { IsEnum, IsNumber, IsOptional, IsString, Max, Min } from "class-validator";
import { Sorting } from "../../types";


export class FilterEbookDto {
  @Expose()
  @IsOptional()
  @IsString()
  phrase: string = '';

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

  @Expose()
  @IsOptional()
  @IsEnum(Sorting)
  sorting: Sorting = Sorting.ASC;

  @Expose()
  @IsOptional()
  @IsNumber()
  limit: number = 10;

  @Expose()
  @IsOptional()
  @IsString()
  category: string = '';
}