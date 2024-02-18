import { Expose } from "class-transformer";
import { IsString } from "class-validator";

export class UserDto {
  @Expose()
  @IsString()
  user_id: string;

  @Expose()
  @IsString()
  username: string;

  @Expose()
  @IsString()
  firstName: string;

  @Expose()
  @IsString()
  lastName: string;

  @Expose()
  @IsString()
  dateOfBirth: string;

  @Expose()
  @IsString()
  phoneNumber: string;

  @Expose()
  @IsString()
  address: string;

  @Expose()
  @IsString()
  city: string;

  @Expose()
  @IsString()
  zip: string;

  @Expose()
  @IsString()
  email: string;

  @Expose()
  @IsString()
  pwdHash: string;

  @Expose()
  @IsString()
  role: string;

  @Expose()
  @IsString()
  currentTokenId: string | null;

}