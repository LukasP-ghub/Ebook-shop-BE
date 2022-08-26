import { Injectable } from '@nestjs/common';
import { CreateDiscountDto } from './dto/create-discount.dto';
import { UpdateDiscountDto } from './dto/update-discount.dto';

@Injectable()
export class DiscountsService {
  create(createDiscountDto: CreateDiscountDto) {
    return 'This action adds a new discound';
  }

  findAll() {
    return `This action returns all discounds`;
  }

  findOne(id: number) {
    return `This action returns a #${id} discound`;
  }

  update(id: number, updateDiscountDto: UpdateDiscountDto) {
    return `This action updates a #${id} discound`;
  }

  remove(id: number) {
    return `This action removes a #${id} discound`;
  }
}
