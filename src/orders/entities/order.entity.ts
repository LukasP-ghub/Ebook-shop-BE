import { Column, Entity, JoinColumn, ManyToOne, OneToMany, PrimaryGeneratedColumn } from "typeorm";
import { User } from "../../user/entities/user.entity";
import { OrderItem } from "./order_item.entity";

@Entity()
export class Order {

  @PrimaryGeneratedColumn('uuid')
  order_id: number;

  @Column({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
  orderDate: Date;

  @Column({ type: 'decimal', precision: 10, scale: 2 })
  totalAmount: number;

  @ManyToOne(() => User, (entity) => entity.order, { cascade: true })
  @JoinColumn({ name: 'user' })
  user: User;

  @OneToMany(() => OrderItem, (entity) => entity.order, { cascade: true })
  orderItem: OrderItem[];

}