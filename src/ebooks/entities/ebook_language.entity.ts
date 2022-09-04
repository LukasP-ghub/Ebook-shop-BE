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
export class EbookLanguage {
  @PrimaryGeneratedColumn('uuid')
  language_id: string;

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

  @OneToMany(() => Ebook, (entity) => entity.language_id)
  ebook: Ebook[]
}
