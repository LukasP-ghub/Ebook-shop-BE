import { Expose } from "class-transformer";
import { IsBoolean, IsOptional, IsString, IsUUID } from "class-validator";


export class CategoryDto {
  @Expose()
  @IsOptional()
  @IsUUID()
  category_id: string;

  @Expose()
  @IsString()
  category_name: string;

  @Expose()
  @IsBoolean()
  popular: boolean;
}