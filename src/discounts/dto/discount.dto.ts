import { Expose } from "class-transformer";
import { IsNumber, IsOptional, IsString, IsUUID } from "class-validator";


export class DiscountDto {
  @Expose()
  @IsOptional()
  @IsUUID()
  discount_id: string;

  @Expose()
  @IsString()
  discount_name: string

  @Expose()
  @IsNumber()
  discount_value: number;
}