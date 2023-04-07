import { Expose } from "class-transformer";
import { IsNumber, IsOptional, IsString, IsUUID } from "class-validator";


export class CoverDto {
  @Expose()
  @IsOptional()
  @IsUUID()
  cover_id: string;

  @Expose()
  @IsString()
  cover_name: string;

  @Expose()
  @IsNumber({ maxDecimalPlaces: 0, allowNaN: false })
  cover_size: number;
}