import {
  BaseEntity,
  Column,
  Entity,
  OneToMany,
  PrimaryGeneratedColumn,
} from 'typeorm';

@Entity()
export class Author extends BaseEntity {
  @PrimaryGeneratedColumn('uuid')
  authorId: string;

  @Column({
    nullable: false,
    length: 100,
  })
  authorName: string;
}
