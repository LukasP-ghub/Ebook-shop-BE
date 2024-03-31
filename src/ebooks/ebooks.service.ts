import { BadRequestException, Inject, Injectable, InternalServerErrorException, forwardRef } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { storageDir } from '../utils/storage';
import { Between, Brackets, In, Like, Repository } from 'typeorm';
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
import { PublishersService } from '../publishers/publishers.service';

@Injectable()
export class EbooksService {
  constructor(
    @Inject(forwardRef(() => AuthorsService)) private authorService: AuthorsService,
    @Inject(forwardRef(() => CategoriesService)) private categoryService: CategoriesService,
    @Inject(forwardRef(() => DiscountsService)) private discountService: DiscountsService,
    @Inject(forwardRef(() => PublishersService)) private publisherService: PublishersService,
    @InjectRepository(Ebook)
    private ebooksRepository: Repository<Ebook>,
  ) { }

  async update(ebook_id: string, upEbookData: UpdateEbookDto, files: MulterDiskUploadedFiles) {
    const photo = files?.cover ?? [];

    try {
      const currEbook = await this.ebooksRepository.findOne({
        where: { ebook_id },
        relations: {
          cover: true,
          author: true,
          category: true,
          discount: true,
        }
      });

      if (!currEbook) return 'Record not found';

      for (const prop in upEbookData) {
        if (typeof upEbookData[prop] !== 'object' && typeof upEbookData[prop] !== 'function') {
          currEbook[prop] = upEbookData[prop];
        } else {
          currEbook[prop] = await this[prop + 'Service'].updateMany(upEbookData[prop], { entityOnly: true });
        }
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
      throw error;
    }
  }


  async filter(filterConditions: FilterEbookDto): Promise<Ebook[]> {
    const { phrase, maxPrice, minPrice, sorting, limit, page, category } = filterConditions;
    const skip = (page - 1) * limit;
    try {
      const res = await this.ebooksRepository.find({
        where: [
          {
            title: Like(`%${phrase}%`),
            price: Between(minPrice, maxPrice),
            category: {
              category_name: Like(`%${category}%`),
            },
          },
          {
            price: Between(minPrice, maxPrice),
            author: {
              author_name: Like(`%${phrase}%`),
            },
            category: {
              category_name: Like(`%${category}%`),
            },
          },
        ],
        order: {
          price: sorting,
        },
        take: limit,
        skip: skip,
        relations: {
          cover: true,
          author: true,
          category: true,
          discount: true,
        }
      });

      return res;
    } catch (error) {
      throw error;
    }
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
      const ebook = this.ebooksRepository.create();

      for (const prop in req) {
        const service = this[`${prop}Service`];

        if (typeof req[prop] !== 'object' && typeof req[prop] !== 'function') {
          ebook[prop] = req[prop];
        } else if (Array.isArray(req[prop])) {
          if (service && typeof service?.findMany === 'function') {
            ebook[prop] = await service.findMany(req[prop]);
          } else {
            throw new BadRequestException(`Service ${prop}Service or method findMany does not exist`);
          }
        } else {
          if (service && typeof service?.findOne === 'function') {
            ebook[prop] = await service.findOne(req[prop]);
          } else {
            throw new BadRequestException(`Service ${prop}Service or method findOne does not exist`);
          }
        }
      }

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


      try {
        const res = await this.ebooksRepository.save(ebook);
        return res;
      } catch (DBError) {
        throw new InternalServerErrorException('A database error occurred');
      }
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
      throw error;
    }

  }

  async findByIds(ebook_ids: string[]) {
    return await this.ebooksRepository.findBy({ ebook_id: In(ebook_ids) });
  }

}