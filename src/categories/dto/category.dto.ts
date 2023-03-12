import { Expose } from "class-transformer";
import { IsOptional } from "class-validator";


export class CategoryDto {
  @Expose()
  @IsOptional()
  category_id: string;

  @Expose()
  category_name: string;

  @Expose()
  popular: boolean;
}