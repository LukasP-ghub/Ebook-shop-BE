import { Expose } from "class-transformer";
import { IsOptional, IsString, IsUUID } from "class-validator";


export class PublisherDto {
  @Expose()
  @IsOptional()
  @IsUUID()
  publisher_id: string;

  @Expose()
  @IsString()
  publisher_name: string
}