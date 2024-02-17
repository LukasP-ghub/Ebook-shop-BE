import { Inject, Injectable, forwardRef } from '@nestjs/common';
import { CreateOrderDto } from './dto/create-order.dto';
import { UpdateOrderDto } from './dto/update-order.dto';
import { EbooksService } from '../ebooks/ebooks.service';
import { InjectRepository } from '@nestjs/typeorm';
import { Order } from './entities/order.entity';
import { Repository } from 'typeorm';
import { User } from '../user/entities/user.entity';
import { UserService } from '../user/user.service';
import { OrderItem } from './entities/order_item.entity';
import { v4 as uuid } from 'uuid';

@Injectable()
export class OrdersService {

  constructor(
    @Inject(forwardRef(() => EbooksService)) private ebooksService: EbooksService,
    @Inject(forwardRef(() => UserService)) private userService: UserService,
    @InjectRepository(Order) private orderRepository: Repository<Order>,
    @InjectRepository(OrderItem) private orderItemRepository: Repository<OrderItem>,
  ) { }


  async create(user: User, createOrderDto: CreateOrderDto) {
    const { products_ids, payment_method, discount_code, address, zip, phoneNumber } = createOrderDto;

    const userDataToUpdate = { address, zip, phoneNumber };
    await this.userService.update(user, userDataToUpdate);

    const productsEntities = await this.ebooksService.findByIds(products_ids);
    const orderItems: OrderItem[] = productsEntities.map(product => {
      const orderItem = this.orderItemRepository.create();
      orderItem.item_id = uuid();
      orderItem.subtotal = product.price;
      orderItem.ebook = product;
      return orderItem;
    });

    const order = this.orderRepository.create();
    order.order_id = createOrderDto.order_id;
    order.orderDate = new Date();
    order.orderItem = orderItems;
    order.payment_method = payment_method;
    order.user = user;
    order.totalAmount = orderItems.reduce((acc, obj) => {
      return acc + +obj.subtotal;
    }, 0);

    const res = await this.orderRepository.save(order);
    return res;
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
