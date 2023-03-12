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

import { Author } from '../../authors/entities/author.entity';
import { Category } from '../../categories/entities/category.entity';
import { Discount } from '../../discounts/entities/discount.entity';
import { Cover } from './cover.entity';
import { EbookLanguage } from './ebook_language.entity';
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

  @ManyToOne(() => EbookLanguage, (entity) => entity.ebook)
  @JoinColumn({ name: 'language' })
  language: EbookLanguage;

  @ManyToOne(() => Publisher, (entity) => entity.ebook)
  @JoinColumn({ name: 'publisher' })
  publisher: Publisher;

  @OneToMany(() => Cover, (entity) => entity.ebook_id)
  cover: Cover[];

  @ManyToMany(() => Author)
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

  @ManyToMany(() => Category)
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

  @ManyToMany(() => Discount)
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
