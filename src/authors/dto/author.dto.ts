import { Expose } from "class-transformer";
import { IsNotEmpty, IsOptional, IsString, IsUUID } from "class-validator";


export class AuthorDto {
  @Expose()
  @IsOptional()
  @IsUUID()
  author_id: string;

  @Expose()
  @IsString()
  author_name: string;
}