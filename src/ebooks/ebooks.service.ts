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
import { EbookLanguage } from './entities/ebook_language.entity';
import { classToPlain, instanceToInstance, instanceToPlain, plainToClass, plainToInstance } from 'class-transformer';
import { EbookLanguageDto } from './dto/ebook-language.dto';

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

  async update(ebook_id: string, upEbookData: UpdateEbookDto, files: MulterDiskUploadedFiles) {
    const photo = files?.cover?.[0] ?? null;

    try {
      const currEbook = await this.ebooksRepository.findOne({
        where: { ebook_id },
        relations: {
          language: true,
          publisher: true,
          author: true,
          category: true,
          discount: true,
          cover: true,
        }
      });

      if (!currEbook) return 'Record not found';
      console.log(upEbookData);

      for (const prop in upEbookData) {
        if (typeof upEbookData[prop] !== 'object' && typeof upEbookData[prop] !== 'function') {
          currEbook[prop] = upEbookData[prop];
        }
      }

      if (upEbookData?.author) {
        upEbookData.author.forEach(newElem => {
          const currAuthor = currEbook.author.find(currElem => currElem.author_id && currElem.author_id === newElem?.author_id);

          if (currAuthor) {
            for (const prop in newElem) {
              currAuthor[prop] = newElem[prop];
            }
          } else {
            const newAuthor = new Author();
            for (const prop in newElem) {
              newAuthor[prop] = newElem[prop];
            }
            currEbook.author.push(newAuthor);
          }
        })
      }

      if (upEbookData?.category) {
        upEbookData.category.forEach(newElem => {
          const currCategory = currEbook.category.find(currElem => currElem.category_id === newElem?.category_id);
          if (currCategory) {
            for (const prop in newElem) {
              currCategory[prop] = newElem[prop];
            }
          } else {
            const newCategory = new Category();
            for (const prop in newElem) {
              newCategory[prop] = newElem[prop];
            }
            currEbook.category.push(newCategory);
          }
        })
      }

      if (upEbookData?.discount) {
        upEbookData.discount.forEach(newElem => {
          const currDiscount = currEbook.discount.find(currElem => currElem.discount_id === newElem?.discount_id);
          if (currDiscount) {
            for (const prop in newElem) {
              currDiscount[prop] = newElem[prop];
            }
          } else {
            const newDiscount = new Discount();
            for (const prop in newElem) {
              newDiscount[prop] = newElem[prop];
            }
            currEbook.discount.push(newDiscount);
          }
        })
      }


      //const res = await this.ebooksRepository.save(currEbook);

      return currEbook;

    }
    catch (error) {
      try {
        if (photo) {
          fs.unlink(path.join(storageDir(), 'book-covers', photo.filename), (err) => {
            if (err) throw err;
            console.log(`file ${photo.filename} was deleted`);
          });
        }
      } catch (error2) {
        throw error2
      }

    }
  }

  remove(id: number) {
    return `This action removes a #${id} ebook`;
  }

  async filter({ key, phrase, maxPrice, minPrice }: FilterEbookDto): Promise<Ebook[]> {
    console.log(key, phrase, maxPrice, minPrice);

    const res = await this.ebooksRepository
      .createQueryBuilder("ebook")
      .leftJoinAndSelect("ebook.author", "ebook_author")
      .leftJoinAndSelect("ebook.category", "ebook_category")
      .leftJoinAndSelect("ebook.discount", "ebook_discount")
      .leftJoinAndSelect("ebook.language", "ebook_language")
      .leftJoinAndSelect("ebook.publisher", "publisher")
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
        // ebook.cover = photo.filename;
      }
      // const { title, author, category, description, discount, pages, price, publication_date, publisher } = req;

      // const authors = author.map(authorName => {
      //   //const authorEntity = new Author();
      //   const authorEntity = authorName;
      //   //authorEntity.author_name = authorName;
      //   return authorEntity;
      // });
      // const categories = category.map(categoryName => {
      //   const categoryEntity = new Category();
      //   // categoryEntity.category_name = categoryName;
      //   return categoryEntity;
      // });
      // // const discounts = discount.map(discountId => {
      // //   const discountEntity = new Discount();
      // //   discountEntity.discount_value = discount;
      // //   return discountEntity;
      // // });


      console.log(ebook);
      console.log(files);


      // await this.ebooksRepository.createQueryBuilder()
      //   .relation(Ebook, "author")
      //   .relation(Category, "category")
      //   .of(ebook)
      //   .add(authors);

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