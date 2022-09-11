import { Controller, Get, Post, Body, Patch, Param, Delete, Query } from '@nestjs/common';
import { EbooksService } from './ebooks.service';
import { CreateEbookDto } from './dto/create-ebook.dto';
import { UpdateEbookDto } from './dto/update-ebook.dto';
import { EbookDBSearchKey } from '../types';
import { FilterEbookDto } from './dto/filter-ebook.dto';

@Controller('ebooks')
export class EbooksController {
  constructor(private readonly ebooksService: EbooksService) { }

  // @Post()
  // create(@Body() createEbookDto: CreateEbookDto) {
  //   return this.ebooksService.create(createEbookDto);
  // }

  // @Get()
  // findAll() {
  //   return this.ebooksService.findAll();
  // }

  // @Get(':id')
  // async findOne(@Param('id') id: string) {
  //   return await this.ebooksService.findOne(+id);
  // }

  @Get('/filter')
  async findMany(@Query() query: FilterEbookDto) {
    console.log(query);

    return await this.ebooksService.getMany(query);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateEbookDto: UpdateEbookDto) {
    return this.ebooksService.update(+id, updateEbookDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.ebooksService.remove(+id);
  }
}
