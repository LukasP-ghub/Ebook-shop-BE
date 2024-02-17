import { IsString, IsArray, IsNotEmpty, IsOptional, IsPhoneNumber, Length, ArrayMinSize, ArrayNotEmpty, IsMobilePhone } from 'class-validator';
import { Expose, Transform } from 'class-transformer';

export class CreateOrderDto {
  @Expose()
  @IsNotEmpty()
  @IsString()
  order_id: string;

  @Expose()
  //@IsNotEmpty()
  @IsArray()
  @ArrayMinSize(1)
  @ArrayNotEmpty()
  products_ids: string[];

  @Expose()
  @IsNotEmpty()
  @IsString()
  payment_method: string;

  @Expose()
  @IsOptional()
  @IsString()
  discount_code: string;

  @Expose()
  @IsNotEmpty()
  @IsString()
  address: string;

  @Expose()
  @IsNotEmpty()
  @IsString()
  @Length(5, 10)
  zip: string;

  @Expose()
  @IsNotEmpty()
  @IsString()
  @IsMobilePhone('pl-PL')
  phoneNumber: string;
}

