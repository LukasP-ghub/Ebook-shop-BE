import { Order } from '../../orders/entities/order.entity';
import {
  BaseEntity,
  Column,
  Entity,
  JoinColumn,
  JoinTable,
  ManyToMany,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from 'typeorm';

@Entity()
export class User {
  @PrimaryGeneratedColumn('uuid')
  user_id: string;

  @Column({
    length: 255,
  })
  email: string;

  // @Column({
  //   length: 12,
  // })
  // login: string;

  @Column()
  pwdHash: string;

  @Column()
  role: string;

  @Column({
    nullable: true,
    default: null
  })
  currentTokenId: string | null;

  @OneToMany(() => Order, (entity) => entity.user)
  order: Order[];
}
