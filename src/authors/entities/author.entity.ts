import {
  Column,
  Entity,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { AuthorDto } from '../dto/author.dto';

@Entity()
export class Author {
  // constructor(data: AuthorDto) {
  //   this.init(data);
  // }

  @PrimaryGeneratedColumn('uuid')
  author_id: string;

  @Column({
    nullable: false,
    length: 100,
  })
  author_name: string;


  // private init = (data: AuthorDto) => {
  //   for (const prop in data) {
  //     this[prop] = data[prop];
  //   }
  // }
}
