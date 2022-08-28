import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { EbookDBSearchKey, EbookDBSearchOptions } from '../types/ebook/ebook';
import { Repository } from 'typeorm';
import { CreateEbookDto } from './dto/create-ebook.dto';
import { UpdateEbookDto } from './dto/update-ebook.dto';
import { Ebook } from './entities/ebook.entity';

@Injectable()
export class EbooksService {
  constructor(
    @InjectRepository(Ebook)
    private ebooksRepository: Repository<Ebook>,
  ) { }

  create(createEbookDto: CreateEbookDto) {
    return 'This action adds a new ebook';
  }

  findAll() {
    return `This action returns all ebooks`;
  }

  findOne(id: number) {
    return `This action returns a #${id} ebook`;
  }

  update(id: number, updateEbookDto: UpdateEbookDto) {
    return `This action updates a #${id} ebook`;
  }

  remove(id: number) {
    return `This action removes a #${id} ebook`;
  }

  async getMany({ key = EbookDBSearchKey.title, phrase = '', maxPrice = 999, minPrice = 0, }: EbookDBSearchOptions): Promise<Ebook[]> {
    return await this.ebooksRepository
      .createQueryBuilder("ebook")
      .leftJoinAndSelect("ebook.author", "ebook_author")
      .leftJoinAndSelect("ebook.category", "ebook_category")
      .leftJoinAndSelect("ebook.discount", "ebook_discount")
      .leftJoinAndSelect("ebook.languageId", "ebook_language")
      .leftJoinAndSelect("ebook.publisherId", "publisher")
      .leftJoinAndSelect("category", "category")
      .leftJoinAndSelect("author", "author")
      .select(['ebook_author.ebook_id', 'ebook_author.author_id', 'ebook.title', 'ebook.num_pages', 'ebook.publication_date', 'ebook.description', 'ebook.price', 'author.author_name', 'publisher.publisher_name', 'ebook_language.language_code', 'ebook_language.language_name', 'category.category_name'])
      .where("ebook_author.ebook_id=ebook.ebook_id")
      .andWhere("ebook_author.author_id=author.author_id")
      .andWhere("ebook.publisher_id=publisher.publisher_id")
      .andWhere("ebook.language_id=ebook_language.language_id")
      .andWhere("ebook_category.ebook_id=ebook_author.ebook_id")
      .andWhere("category.category_id = ebook_category.category_id")
      .andWhere("author.author_id :phrase", { phrase })
      .andWhere("author.author_name LIKE CONCAT('%',:phrase,'%')", { phrase })
      .andWhere("ebook.title LIKE CONCAT('%',:phrase,'%')", { phrase })
      .andWhere("ebook.price <= :maxPrice", { maxPrice })
      .andWhere("ebook.price >= :minPrice", { minPrice })
      .getMany()
  }
}


// SELECT ebook_author.ebook_id, ebook_author.author_id, ebook.title, ebook.num_pages, ebook.publication_date, ebook.description, ebook.price, author.author_name, publisher.publisher_name, ebook_language.language_code, ebook_language.language_name, category.category_name
//         FROM ebook_author 
//         INNER JOIN ebook ON ebook_author.ebook_id=ebook.ebook_id
//         INNER JOIN author ON ebook_author.author_id=author.author_id 
//         INNER JOIN publisher ON ebook.publisher_id=publisher.publisher_id 
//         INNER JOIN ebook_language ON ebook.language_id=ebook_language.language_id 
//         INNER JOIN ebook_category ON ebook_category.ebook_id=ebook_author.ebook_id
//         INNER JOIN category ON category.category_id = ebook_category.category_id
//         ;

// SELECT ebook_author.ebook_id, ebook_author.author_id, ebook.title, ebook.num_pages, ebook.publication_date, ebook.description, ebook.price, author.author_name, publisher.publisher_name, ebook_language.language_code, ebook_language.language_name, category.category_name
//         FROM ebook_author 
//         INNER JOIN ebook ON ebook_author.ebook_id=ebook.ebook_id ${key === EbookDBSearchKey.title ? `AND ebook.title LIKE CONCAT( '%',:phrase,'%')` : ''} AND ebook.price <= :maxPrice AND ebook.price >= :minPrice
//         INNER JOIN author ON ebook_author.author_id=author.author_id ${key === EbookDBSearchKey.author_id ? `AND author.author_id = :phrase'` : key === EbookDBSearchKey.author_name ? `AND author.author_name LIKE CONCAT( '%',:phrase,'%')` : ''}
//         INNER JOIN publisher ON ebook.publisher_id=publisher.publisher_id 
//         INNER JOIN ebook_language ON ebook.language_id=ebook_language.language_id 
//         INNER JOIN ebook_category ON ebook_category.ebook_id=ebook_author.ebook_id
//         INNER JOIN category ON category.category_id = ebook_category.category_id
//         ;