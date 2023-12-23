import { Module, forwardRef } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { EbooksService } from './ebooks.service';
import { EbooksController } from './ebooks.controller';
import { Ebook } from './entities/ebook.entity';
import { AuthorsModule } from '../authors/authors.module';

@Module({
  imports: [TypeOrmModule.forFeature([Ebook]), forwardRef(() => AuthorsModule)],
  controllers: [EbooksController],
  providers: [EbooksService]
})
export class EbooksModule { }
