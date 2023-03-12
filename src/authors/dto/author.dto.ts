import { Expose } from "class-transformer";
import { IsNotEmpty, IsOptional, IsUUID } from "class-validator";


export class AuthorDto {
  @Expose()
  @IsOptional()
  @IsUUID()
  author_id: string;

  @Expose()
  author_name: string;
}