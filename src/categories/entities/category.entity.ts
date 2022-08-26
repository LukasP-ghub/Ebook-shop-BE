import {
  BaseEntity,
  Column,
  Entity,
  OneToMany,
  PrimaryGeneratedColumn,
} from 'typeorm';

@Entity()
export class Category extends BaseEntity {
  @PrimaryGeneratedColumn('uuid')
  categoryId: string;

  @Column({
    nullable: false,
    length: 30,
  })
  categoryName: string;

  @Column({
    type: 'boolean'
  })
  popular: boolean;
}
