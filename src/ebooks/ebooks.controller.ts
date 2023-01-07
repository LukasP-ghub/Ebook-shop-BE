import { Controller, Get, Post, Body, Patch, Param, Delete, Query, Res, UseInterceptors, UploadedFiles } from '@nestjs/common';
import { EbooksService } from './ebooks.service';
import { AddEbookDto } from './dto/add-ebook.dto';
import { UpdateEbookDto } from './dto/update-ebook.dto';
import { EbookDBSearchKey, MulterDiskUploadedFiles } from '../types';
import { FilterEbookDto } from './dto/filter-ebook.dto';
import { Ebook } from './entities/ebook.entity';
import { FileFieldsInterceptor } from '@nestjs/platform-express';
import { multerStorage, storageDir } from '../utils/storage';
import * as path from 'path';

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

  @Get('/photo/:id')
  async getPhoto(
    @Param('id') id: string,
    @Res() res: any
  ): Promise<any> {
    return await this.ebooksService.getPhoto(id, res);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateEbookDto: UpdateEbookDto) {
    return this.ebooksService.update(+id, updateEbookDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.ebooksService.remove(+id);
  }

  @Post('/')
  @UseInterceptors(
    FileFieldsInterceptor([
      {
        name: 'cover', maxCount: 10,
      },
    ], { storage: multerStorage(path.join(storageDir(), 'product-photos')) },
    ),
  )
  addEbook(
    @Body() req: AddEbookDto,
    @UploadedFiles() files: MulterDiskUploadedFiles,
  ): Promise<string> {
    return this.ebooksService.addEbook(req, files);
  }

}
