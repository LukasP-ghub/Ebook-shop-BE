import { Expose } from "class-transformer";


export class PublisherDto {
  @Expose()
  publisher_id: string;

  @Expose()
  publisher_name: string
}