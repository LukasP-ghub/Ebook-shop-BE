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
export class EbookLanguage extends BaseEntity {
  @PrimaryGeneratedColumn('uuid')
  languageId: string;

  @Column({
    nullable: false,
    length: 20,
  })
  languageName: string

  @Column({
    length: 5,
    nullable: false,
  })
  languageCode: string;

  @OneToMany(() => Ebook, (entity) => entity.languageId)
  ebook: Ebook[]
}
