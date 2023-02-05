import { Expose } from "class-transformer";


export class CategoryDto {
  @Expose()
  category_id: string;

  @Expose()
  category_name: string;

  @Expose()
  popular: boolean;
}