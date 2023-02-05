import { Expose } from "class-transformer";


export class DiscountDto {
  @Expose()
  discount_id: string;

  @Expose()
  discount_name: string

  @Expose()
  discount_value: number;
}