import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { TYPEORM_CONFIG } from './config/typeOrm.config';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { EbooksModule } from './ebooks/ebooks.module';
import { AuthorsModule } from './authors/authors.module';
import { CategoriesModule } from './categories/categories.module';
import { DiscountsModule } from './discounts/discounts.module';
import { DataSource } from 'typeorm';

@Module({
  imports: [
    TypeOrmModule.forRoot(TYPEORM_CONFIG),
    EbooksModule,
    AuthorsModule,
    CategoriesModule,
    DiscountsModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {
  constructor(private dataSource: DataSource) { }
}
