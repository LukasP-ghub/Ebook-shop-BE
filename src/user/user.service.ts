import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { hashPwd } from '../utils/hash-pwd';
import { RegisterUserResponse } from '../types/user';
import { CreateUserDto } from './dto/create-user.dto';
import { RegisterDto } from './dto/register.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { User } from './entities/user.entity';
import { Repository } from 'typeorm';

@Injectable()
export class UserService {
  constructor(
    @InjectRepository(User)
    private userRepository: Repository<User>,) { }

  filterUserData(user: User): RegisterUserResponse {
    const { email, user_id } = user;
    return { user_id, email };
  }

  async register(newUser: RegisterDto): Promise<RegisterUserResponse> {
    const user = new User();
    user.email = newUser.email;
    user.pwdHash = hashPwd(newUser.pwd);


    return this.filterUserData(user);
  }

  create(createUserDto: CreateUserDto) {
    return 'This action adds a new user';
  }

  findAll() {
    return `This action returns all user`;
  }

  findOne(id: number) {
    return `This action returns a #${id} user`;
  }

  update(id: number, updateUserDto: UpdateUserDto) {
    return `This action updates a #${id} user`;
  }

  remove(id: number) {
    return `This action removes a #${id} user`;
  }
}
