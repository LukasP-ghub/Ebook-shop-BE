import { Controller, Get, Post, Body, Patch, Param, Delete, UseGuards } from '@nestjs/common';
import { UserService } from './user.service';
import { UpdateUserDto } from './dto/update-user.dto';
import { RegisterDto } from './dto/register.dto';
import { Roles } from '../decorators/roles.decorator';
import { AuthGuard } from '@nestjs/passport';
import { RolesGuard } from '../guards/roles.guard';
import { User } from './entities/user.entity';
import { UserObj } from '../decorators/user-obj.decorator';

@Controller('user')
export class UserController {
  constructor(private readonly userService: UserService) { }

  @Post('/create')
  create(@Body() register: RegisterDto) {
    return this.userService.register(register);
  }

  @Get()
  @Roles('admin')
  @UseGuards(AuthGuard('jwt'), RolesGuard)
  findAll() {
    // return this.userService.findAll();
  }

  @Get(':id')
  @Roles('admin')
  @UseGuards(AuthGuard('jwt'), RolesGuard)
  findOne(@Param('id') id: string) {
    // return this.userService.findOne(+id);
  }

  @Patch('/update')
  @Roles('user')
  @UseGuards(AuthGuard('jwt'), RolesGuard)
  update(
    @Body() updateUserDto: UpdateUserDto,
    @UserObj() user: User) {
    return this.userService.update(user, updateUserDto);
  }

  @Delete('/remove')
  @Roles('user')
  @UseGuards(AuthGuard('jwt'), RolesGuard)
  remove(@UserObj() user: User) {
    return this.userService.remove(user);
  }
}
