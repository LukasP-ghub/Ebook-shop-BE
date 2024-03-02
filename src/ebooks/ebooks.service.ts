import { Inject, Injectable, forwardRef } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { storageDir } from '../utils/storage';
import { Brackets, In, Repository } from 'typeorm';
import { EbookDBSearchKey } from '../types/ebook/ebook';
import { AddEbookDto } from './dto/add-ebook.dto';
import { FilterEbookDto } from './dto/filter-ebook.dto';
import { UpdateEbookDto } from './dto/update-ebook.dto';
import { Ebook } from './entities/ebook.entity';
import * as path from 'path';
import * as fs from 'fs';
import { MulterDiskUploadedFiles } from '../types';
import { Cover } from './entities/cover.entity';
import { AuthorsService } from '../authors/authors.service';
import { CategoriesService } from '../categories/categories.service';
import { DiscountsService } from '../discounts/discounts.service';

@Injectable()
export class EbooksService {
  constructor(
    @Inject(forwardRef(() => AuthorsService)) private authorService: AuthorsService,
    @Inject(forwardRef(() => CategoriesService)) private categoryService: CategoriesService,
    @Inject(forwardRef(() => DiscountsService)) private discountService: DiscountsService,
    @InjectRepository(Ebook)
    private ebooksRepository: Repository<Ebook>,
  ) { }

  async update(ebook_id: string, upEbookData: UpdateEbookDto, files: MulterDiskUploadedFiles) {
    const photo = files?.cover ?? [];
    const relationsToUpdate = {};

    for (const prop in upEbookData) {
      if (typeof upEbookData[prop] === 'object' && typeof upEbookData[prop] !== 'function') {
        relationsToUpdate[prop] = true;
      }
    }

    try {
      const currEbook = await this.ebooksRepository.findOne({
        where: { ebook_id },
        relations: relationsToUpdate
      });

      if (!currEbook) return 'Record not found';

      for (const prop in upEbookData) {
        if (typeof upEbookData[prop] !== 'object' && typeof upEbookData[prop] !== 'function') {
          currEbook[prop] = upEbookData[prop];
        }
      }

      if (upEbookData?.author) {
        currEbook.author = await this.authorService.updateMany(upEbookData.author, { entityOnly: true })
      }

      if (upEbookData?.category) {
        currEbook.category = await this.categoryService.updateMany(upEbookData.category, { entityOnly: true })
      }

      if (upEbookData?.discount) {
        currEbook.discount = await this.discountService.updateMany(upEbookData.discount, { entityOnly: true })
      }

      if (photo.length) {
        photo.forEach(newElem => {
          const newPhoto = new Cover();
          newPhoto.cover_id = newElem.filename;
          newPhoto.cover_name = newElem.originalname;
          newPhoto.cover_size = newElem.size;
          currEbook.cover.push(newPhoto);
        })
      }
      const res = await this.ebooksRepository.save(currEbook);

      return res;

    }
    catch (error) {
      try {
        if (photo) {
          photo.forEach((item) => {
            fs.unlink(path.join(storageDir(), 'book-covers', item.filename), (err) => {
              if (err) throw err;
              console.log(`file ${item.filename} was deleted`);
            });
          })

        }
      } catch (error2) {
        throw error2
      }

    }
  }


  async filter({ key, phrase, maxPrice, minPrice }: FilterEbookDto): Promise<Ebook[]> {

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
          root: path.join(storageDir(), 'book-covers'),
        },
      );
    } catch (e) {
      res.json({ error: e.message })
    }
  }


  async addEbook(req: AddEbookDto, files: MulterDiskUploadedFiles) {
    const photo = files?.cover ?? [];

    try {
      const ebook = this.ebooksRepository.create(req);

      if (photo.length) {
        ebook.cover = [];
        photo.forEach(newElem => {
          const newPhoto = new Cover();
          newPhoto.cover_id = newElem.filename;
          newPhoto.cover_name = newElem.originalname;
          newPhoto.cover_size = newElem.size;
          ebook.cover.push(newPhoto);
        })
      }

      const res = await this.ebooksRepository.save(ebook);
      return res;

    } catch (error) {
      try {
        if (photo) {
          photo.forEach((item) => {
            fs.unlink(path.join(storageDir(), 'book-covers', item.filename), (err) => {
              if (err) throw err;
              console.log(`file ${item.filename} was deleted`);
            });
          })

        }
      } catch (error2) {
        throw error2
      }

    }
  }

  async findByIds(ebook_ids: string[]) {
    return await this.ebooksRepository.findBy({ ebook_id: In(ebook_ids) });
  }

}