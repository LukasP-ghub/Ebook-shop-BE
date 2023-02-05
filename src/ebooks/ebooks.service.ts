import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { storageDir } from '../utils/storage';
import { Brackets, Repository } from 'typeorm';
import { EbookDBSearchKey } from '../types/ebook/ebook';
import { AddEbookDto } from './dto/add-ebook.dto';
import { FilterEbookDto } from './dto/filter-ebook.dto';
import { UpdateEbookDto } from './dto/update-ebook.dto';
import { Ebook } from './entities/ebook.entity';
import * as path from 'path';
import * as fs from 'fs';
import { MulterDiskUploadedFiles } from '../types';
import { Author } from '../authors/entities/author.entity';
import { Category } from '../categories/entities/category.entity';
import { Discount } from '../discounts/entities/discount.entity';

@Injectable()
export class EbooksService {
  constructor(
    @InjectRepository(Ebook)
    private ebooksRepository: Repository<Ebook>,
  ) { }

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

  async getMany({ key, phrase, maxPrice, minPrice }: FilterEbookDto): Promise<Ebook[]> {
    console.log(key, phrase, maxPrice, minPrice);

    const res = await this.ebooksRepository
      .createQueryBuilder("ebook")
      .leftJoinAndSelect("ebook.author", "ebook_author")
      .leftJoinAndSelect("ebook.category", "ebook_category")
      .leftJoinAndSelect("ebook.discount", "ebook_discount")
      .leftJoinAndSelect("ebook.language_id", "ebook_language")
      .leftJoinAndSelect("ebook.publisher_id", "publisher")
      .select(['ebook_author.author_id', 'ebook_author.author_name', 'ebook.ebook_id', 'ebook.title', 'ebook.pages', 'ebook.publication_date', 'ebook.description', 'ebook.price', 'publisher.publisher_name', 'ebook_language.language_code', 'ebook_language.language_name', 'ebook_category.category_id', 'ebook_category.category_name', 'ebook_category.popular'])
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
    console.log(res);

    return res;
  }

  // async getMany({ key = EbookDBSearchKey.title, phrase = '', maxPrice = 999, minPrice = 0, }: FilterEbookDto): Promise<Ebook[]> {
  //   const res = await this.ebooksRepository
  //     .createQueryBuilder("ebook")
  //     .leftJoinAndSelect("ebook.author", "ebook_author")
  //     .leftJoinAndSelect("ebook.category", "ebook_category")
  //     .leftJoinAndSelect("ebook.discount", "ebook_discount")
  //     .leftJoinAndSelect("ebook.language_id", "ebook_language")
  //     .leftJoinAndSelect("ebook.publisher_id", "publisher")
  //     .select(['ebook_author.author_id', 'ebook_author.author_name', 'ebook.ebook_id', 'ebook.title', 'ebook.pages', 'ebook.publication_date', 'ebook.description', 'ebook.price', 'publisher.publisher_name', 'ebook_language.language_code', 'ebook_language.language_name', 'ebook_category.category_name', 'ebook_category.popular'])
  //     .where(new Brackets((qb) => {
  //       switch (key) {
  //         case EbookDBSearchKey.author_id:
  //           qb.where("ebook_author.author_id = :phrase", { phrase })
  //           break;

  //         case EbookDBSearchKey.author_name:
  //           qb.where("ebook_author.author_name LIKE CONCAT('%',:phrase,'%')", { phrase })
  //           break;

  //         case EbookDBSearchKey.ebook_category:
  //           qb.where("ebook_category.category_name = :phrase", { phrase })
  //           break;

  //         default:
  //           qb.where("ebook.title LIKE CONCAT('%',:phrase,'%')", { phrase })
  //           break;
  //       }
  //     }))
  //     .andWhere("ebook.price <= :maxPrice", { maxPrice })
  //     .andWhere("ebook.price >= :minPrice", { minPrice })
  //     .getMany();

  //   return res;
  // }

  async getPhoto(ebook_id: string, res: any) {
    try {
      const product = await this.ebooksRepository.findOneBy({ ebook_id });
      if (!product) throw new Error('No object found!');
      if (!product.cover) throw new Error('No photo in this entity!');

      res.sendFile(
        product.cover,
        {
          root: path.join(storageDir(), ''),
        },
      );
    } catch (e) {
      res.json({ error: e.message })
    }
  }

  //@ToDo -> finish: adding to db, create ebook instance
  async addEbook(req: AddEbookDto, files: MulterDiskUploadedFiles): Promise<string> {
    const photo = files?.photo?.[0] ?? null;
    try {

      const ebook = new Ebook();


      if (photo) {
        ebook.cover = photo.filename;
      }
      const { title, author, category, description, discount, language_id, pages, price, publication_date, publisher_id } = req;

      const authors = author.map(authorName => {
        const authorEntity = new Author();
        authorEntity.author_name = authorName;
        return authorEntity;
      });
      const categories = category.map(categoryName => {
        const categoryEntity = new Category();
        categoryEntity.category_name = categoryName;
        return categoryEntity;
      });
      // const discounts = discount.map(discountId => {
      //   const discountEntity = new Discount();
      //   discountEntity.discount_value = discount;
      //   return discountEntity;
      // });

      ebook.title = title;
      ebook.description = description;
      ebook.pages = pages;
      ebook.price = price;
      ebook.publication_date = publication_date;
      // ebook.publisher_id = publisher_id;
      //ebook.language_id = language_id;
      //ebook.discount = discount;

      console.log(ebook);


      await this.ebooksRepository.createQueryBuilder()
        .relation(Ebook, "author")
        .relation(Category, "category")
        .of(ebook)
        .add(authors);

      return 'Ebook saved';
    } catch (error) {
      if (photo) {
        fs.unlink(path.join(storageDir(), 'book-covers', photo.filename), (err) => {
          if (err) throw err;
          console.log(`file ${photo.filename} was deleted`);
        });
      }
    }
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