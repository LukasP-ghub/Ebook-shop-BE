import { Expose } from "class-transformer";
import { IsOptional } from "class-validator";


export class DiscountDto {
  @Expose()
  @IsOptional()
  discount_id: string;

  @Expose()
  discount_name: string

  @Expose()
  discount_value: number;
}