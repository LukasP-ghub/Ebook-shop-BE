import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Brackets, Repository } from 'typeorm';
import { EbookDBSearchKey } from '../types/ebook/ebook';
import { CreateEbookDto } from './dto/create-ebook.dto';
import { FilterEbookDto } from './dto/filter-ebook.dto';
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

  async getMany({ key = EbookDBSearchKey.title, phrase = '', maxPrice = 999, minPrice = 0, }: FilterEbookDto): Promise<Ebook[]> {
    const res = await this.ebooksRepository
      .createQueryBuilder("ebook")
      .leftJoinAndSelect("ebook.author", "ebook_author")
      .leftJoinAndSelect("ebook.category", "ebook_category")
      .leftJoinAndSelect("ebook.discount", "ebook_discount")
      .leftJoinAndSelect("ebook.language_id", "ebook_language")
      .leftJoinAndSelect("ebook.publisher_id", "publisher")
      .select(['ebook_author.author_id', 'ebook_author.author_name', 'ebook.ebook_id', 'ebook.title', 'ebook.pages', 'ebook.publication_date', 'ebook.description', 'ebook.price', 'publisher.publisher_name', 'ebook_language.language_code', 'ebook_language.language_name', 'ebook_category.category_name', 'ebook_category.popular'])
      .where(new Brackets((qb) => {
        switch (key) {
          case EbookDBSearchKey.author_id:
            qb.where("ebook_author.author_id = :phrase", { phrase })
            break;

          case EbookDBSearchKey.author_name:
            qb.where("ebook_author.author_name LIKE CONCAT('%',:phrase,'%')", { phrase })
            break;

          case EbookDBSearchKey.ebook_category:
            qb.where("ebook_category.category_name = :phrase", { phrase })
            break;

          default:
            qb.where("ebook.title LIKE CONCAT('%',:phrase,'%')", { phrase })
            break;
        }
      }))
      .andWhere("ebook.price <= :maxPrice", { maxPrice })
      .andWhere("ebook.price >= :minPrice", { minPrice })
      .getMany();

    return res;
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