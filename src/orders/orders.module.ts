import { Module, forwardRef } from '@nestjs/common';
import { OrdersService } from './orders.service';
import { OrdersController } from './orders.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Order } from './entities/order.entity';
import { EbooksModule } from '../ebooks/ebooks.module';
import { UserModule } from '../user/user.module';
import { OrderItem } from './entities/order_item.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Order]), TypeOrmModule.forFeature([OrderItem]), forwardRef(() => EbooksModule), forwardRef(() => UserModule)],
  controllers: [OrdersController],
  providers: [OrdersService]
})
export class OrdersModule { }
