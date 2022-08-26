import {
  BaseEntity,
  Column,
  Entity,
  JoinTable,
  ManyToMany,
  OneToMany,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { Ebook } from './ebook.entity';

@Entity()
export class Publisher extends BaseEntity {
  @PrimaryGeneratedColumn('uuid')
  publisherId: string;

  @Column({
    nullable: false,
    length: 50,
  })
  publisherName: string

  @OneToMany(() => Ebook, (entity) => entity.publisherId)
  ebook: Ebook[]
}
