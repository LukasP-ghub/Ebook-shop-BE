import { Expose } from "class-transformer";
import { IsBoolean, IsString, IsUUID } from "class-validator";


export class CategoryDto {
  @Expose()
  @IsUUID()
  category_id: string;

  @Expose()
  @IsString()
  category_name: string;

  @Expose()
  @IsBoolean()
  popular: boolean;
}