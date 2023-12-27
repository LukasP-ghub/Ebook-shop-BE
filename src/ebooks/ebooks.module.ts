import { Module, forwardRef } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { EbooksService } from './ebooks.service';
import { EbooksController } from './ebooks.controller';
import { Ebook } from './entities/ebook.entity';
import { AuthorsModule } from '../authors/authors.module';
import { CategoriesModule } from 'src/categories/categories.module';

@Module({
  imports: [TypeOrmModule.forFeature([Ebook]), forwardRef(() => AuthorsModule), forwardRef(() => CategoriesModule)],
  controllers: [EbooksController],
  providers: [EbooksService]
})
export class EbooksModule { }
