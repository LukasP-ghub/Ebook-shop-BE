import { Injectable } from '@nestjs/common';
import { CreateAuthorDto } from './dto/create-author.dto';
import { UpdateAuthorDto } from './dto/update-author.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { Author } from './entities/author.entity';
import { Repository } from 'typeorm';

@Injectable()
export class AuthorsService {
  constructor(
    @InjectRepository(Author)
    private authorRepository: Repository<Author>,
  ) { }

  async create(req: CreateAuthorDto) {
    try {
      const author = this.authorRepository.create(req);
      const res = await this.authorRepository.save(author);
      return res;

    } catch (error) {
      throw error;
    }
  }

  async findAll() {
    try {
      const authors = await this.authorRepository.find();
      return authors;

    } catch (error) {
      throw error;
    }
  }

  async findOne(author_id: string) {
    try {
      const author = await this.authorRepository.findOne({
        where: { author_id },
      });
      return author;

    } catch (error) {
      throw error;
    }
  }

  async update(author_id: string, updateAuthorDto: UpdateAuthorDto, options = { entityOnly: false }) {
    try {
      const currAuthor = await this.authorRepository.findOne({
        where: { author_id },
      });

      for (const prop in updateAuthorDto) {
        currAuthor[prop] = updateAuthorDto[prop];
      }

      const res = options.entityOnly ? currAuthor : await this.authorRepository.save(currAuthor);
      return res;
    }
    catch (error) {
      throw error;
    }
  }

  async updateMany(updateAuthors: UpdateAuthorDto[], options = { entityOnly: false }) {
    try {
      const res = await Promise.all(updateAuthors.map(async (updateAuthor) => {
        const updatedAuthor = await this.update(updateAuthor.author_id, updateAuthor, options);
        return updatedAuthor;
      }));

      return res;
    } catch (error) {
      throw error;
    }
  }

  remove(id: number) {
    return `This action removes a #${id} author`;
  }
}
