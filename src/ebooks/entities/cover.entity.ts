import {
  Column,
  Entity,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { Ebook } from './ebook.entity';

@Entity()
export class Cover {
  @PrimaryGeneratedColumn('uuid')
  cover_id: string;

  @Column({
    nullable: false,
    length: 50,
  })
  photo_name: string;

  @Column({
    nullable: false,
    length: 255,
  })
  photo_url: string;

  @ManyToOne(() => Ebook, (entity) => entity.cover)
  @JoinColumn({ name: 'ebook_id' })
  ebook_id: Ebook;
}
