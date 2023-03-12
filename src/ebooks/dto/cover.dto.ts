import { Expose } from "class-transformer";
import { IsOptional, IsString } from "class-validator";


export class CoverDto {
  @Expose()
  @IsOptional()
  cover_id: string;

  @Expose()
  @IsString()
  photo_name: string;

  @Expose()
  @IsString()
  photo_url: string;
}