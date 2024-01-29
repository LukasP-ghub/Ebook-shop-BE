import { Inject, Injectable, forwardRef } from '@nestjs/common';
import { CreateOrderDto } from './dto/create-order.dto';
import { UpdateOrderDto } from './dto/update-order.dto';
import { EbooksService } from '../ebooks/ebooks.service';
import { InjectRepository } from '@nestjs/typeorm';
import { Order } from './entities/order.entity';
import { Repository } from 'typeorm';

@Injectable()
export class OrdersService {

  constructor(
    @Inject(forwardRef(() => EbooksService)) private ebooksService: EbooksService,
    @InjectRepository(Order) private orderRepository: Repository<Order>
  ) { }

  create(user, createOrderDto: CreateOrderDto) {
    const { products_ids, payment_method, discount_code, customer_first_name, customer_last_name, customer_address, zip_code, tel_number } = createOrderDto;

    return 'This action adds a new order';
  }

  findAll() {
    return `This action returns all orders`;
  }

  findOne(id: number) {
    return `This action returns a #${id} order`;
  }

  update(id: number, updateOrderDto: UpdateOrderDto) {
    return `This action updates a #${id} order`;
  }

  remove(id: number) {
    return `This action removes a #${id} order`;
  }
}
