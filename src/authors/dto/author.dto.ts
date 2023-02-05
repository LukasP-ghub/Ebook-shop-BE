import { Expose } from "class-transformer";


export class AuthorDto {
  @Expose()
  author_id: string;

  @Expose()
  author_name: string;
}