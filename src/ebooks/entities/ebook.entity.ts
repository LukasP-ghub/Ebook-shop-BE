import {
  Column,
  Entity,
  JoinColumn,
  JoinTable,
  ManyToMany,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from 'typeorm';

import { Author } from '../../authors/entities/author.entity';
import { Category } from '../../categories/entities/category.entity';
import { Discount } from '../../discounts/entities/discount.entity';
import { OrderItem } from '../../orders/entities/order_item.entity';
import { Cover } from './cover.entity';
import { Publisher } from './publisher.entity';

@Entity()
export class Ebook {
  @PrimaryGeneratedColumn('uuid')
  ebook_id: string;

  @Column({
    nullable: false,
    length: 100,
  })
  title: string;

  @Column({
    type: 'int',
  })
  pages: number;

  @Column({
    type: 'date',
    nullable: false,
  })
  publication_date: string;

  @Column({
    type: 'text',
  })
  description: string;

  @Column({
    type: 'decimal',
    precision: 5,
    scale: 2,
    nullable: true,
  })
  price: number;

  @Column({
    nullable: false,
    length: 20,
  })
  language_name: string

  @Column({
    length: 5,
    nullable: false,
  })
  language_code: string;

  @Column({
    nullable: false,
  })
  file: string;

  // @ManyToOne(() => EbookLanguage, (entity) => entity.ebook, { cascade: true })
  // @JoinColumn({ name: 'language' })
  // language: EbookLanguage;

  @ManyToOne(() => Publisher, (entity) => entity.ebook, { cascade: true })
  @JoinColumn({ name: 'publisher' })
  publisher: Publisher;

  @OneToMany(() => Cover, (entity) => entity.ebook_id, { cascade: true })
  cover: Cover[];

  @OneToMany(() => OrderItem, (entity) => entity.ebook)
  orderItem: OrderItem[]

  @ManyToMany(() => Author, { cascade: true })
  @JoinTable({
    name: 'ebook_author',
    joinColumn: {
      name: "ebook_id",
      referencedColumnName: "ebook_id"
    },
    inverseJoinColumn: {
      name: "author_id",
      referencedColumnName: "author_id"
    }
  })
  author: Author[];

  @ManyToMany(() => Category, { cascade: true })
  @JoinTable({
    name: 'ebook_category',
    joinColumn: {
      name: "ebook_id",
      referencedColumnName: "ebook_id"
    },
    inverseJoinColumn: {
      name: "category_id",
      referencedColumnName: "category_id"
    }
  })
  category: Category[];

  @ManyToMany(() => Discount, { cascade: true })
  @JoinTable({
    name: 'ebook_discount',
    joinColumn: {
      name: "ebook_id",
      referencedColumnName: "ebook_id"
    },
    inverseJoinColumn: {
      name: "discount_id",
      referencedColumnName: "discount_id"
    }
  })
  discount: Discount[];


}
