import { Expose } from "class-transformer";
import { IsOptional, IsString, IsUUID } from "class-validator";


export class AuthorDto {
  @Expose()
  @IsUUID()
  author_id: string;

  @Expose()
  @IsString()
  author_name: string;
}