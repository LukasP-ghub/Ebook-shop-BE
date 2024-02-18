import { Injectable } from '@nestjs/common';
import { CreateCategoryDto } from './dto/create-category.dto';
import { UpdateCategoryDto } from './dto/update-category.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { Category } from './entities/category.entity';
import { Repository } from 'typeorm';

@Injectable()
export class CategoriesService {
  constructor(
    @InjectRepository(Category)
    private categoryRepository: Repository<Category>,
  ) { }

  async update(category_id: string, updateCategoryDto: UpdateCategoryDto, options = { entityOnly: false }) {
    try {
      const currCategory = await this.categoryRepository.findOne({
        where: { category_id },
      });

      for (const prop in updateCategoryDto) {
        currCategory[prop] = updateCategoryDto[prop];
      }

      const res = options.entityOnly ? currCategory : await this.categoryRepository.save(currCategory);
      return res;
    }
    catch (error) {
      throw error;
    }
  }

  async updateMany(updateCategories: UpdateCategoryDto[], options = { entityOnly: false }) {
    try {
      const res = await Promise.all(updateCategories.map(async (updateCategory) => {
        const updatedCategory = await this.update(updateCategory.category_id, updateCategory, options);
        return updatedCategory;
      }));

      return res;
    } catch (error) {
      throw error;
    }
  }

}
