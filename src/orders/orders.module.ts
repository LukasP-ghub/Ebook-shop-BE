import { Module, forwardRef } from '@nestjs/common';
import { OrdersService } from './orders.service';
import { OrdersController } from './orders.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Order } from './entities/order.entity';
import { EbooksModule } from '../ebooks/ebooks.module';

@Module({
  imports: [TypeOrmModule.forFeature([Order]), forwardRef(() => EbooksModule)],
  controllers: [OrdersController],
  providers: [OrdersService]
})
export class OrdersModule { }
