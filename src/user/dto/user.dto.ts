import { Expose } from "class-transformer";
import { IsString } from "class-validator";

export class UserDto {
  @Expose()
  @IsString()
  user_id: string;

  @Expose()
  @IsString()
  email: string;

  @Expose()
  @IsString()
  login: string;

  @Expose()
  @IsString()
  pwdHash: string;

}