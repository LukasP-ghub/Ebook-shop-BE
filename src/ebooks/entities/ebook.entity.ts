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
import { EbookLanguage } from './ebook_language.entity';
import { Publisher } from './publisher.entity';

@Entity()
export class Ebook {
  @PrimaryGeneratedColumn('uuid')
  ebookId: string;

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
  @JoinColumn({ name: 'languageId' })
  languageId: EbookLanguage;

  @ManyToOne(() => Publisher, (entity) => entity.ebook)
  @JoinColumn({ name: 'publisherId' })
  publisherId: Publisher;

  @ManyToMany(() => Author)
  @JoinTable({
    name: 'ebook_author',
    joinColumn: {
      name: "ebookId",
      referencedColumnName: "ebookId"
    },
    inverseJoinColumn: {
      name: "authorId",
      referencedColumnName: "authorId"
    }
  })
  author: Author[];

  @ManyToMany(() => Category)
  @JoinTable({
    name: 'ebook_category',
    joinColumn: {
      name: "ebookId",
      referencedColumnName: "ebookId"
    },
    inverseJoinColumn: {
      name: "categoryId",
      referencedColumnName: "categoryId"
    }
  })
  category: Category[];

  @ManyToMany(() => Discount)
  @JoinTable({
    name: 'ebook_discount',
    joinColumn: {
      name: "ebookId",
      referencedColumnName: "ebookId"
    },
    inverseJoinColumn: {
      name: "discountId",
      referencedColumnName: "discountId"
    }
  })
  discount: Discount[];

}
