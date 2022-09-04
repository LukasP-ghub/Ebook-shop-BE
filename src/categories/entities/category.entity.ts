import {
  BaseEntity,
  Column,
  Entity,
  OneToMany,
  PrimaryGeneratedColumn,
} from 'typeorm';

@Entity()
export class Category {
  @PrimaryGeneratedColumn('uuid')
  category_id: string;

  @Column({
    nullable: false,
    length: 30,
  })
  category_name: string;

  @Column({
    type: 'boolean'
  })
  popular: boolean;
}
