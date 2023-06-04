import { Controller, Get, Post, Body, Patch, Param, Delete, Query, Res, UseInterceptors, UploadedFiles, UseGuards } from '@nestjs/common';
import { EbooksService } from './ebooks.service';
import { AddEbookDto } from './dto/add-ebook.dto';
import { UpdateEbookDto } from './dto/update-ebook.dto';
import { EbookDBSearchKey, MulterDiskUploadedFiles } from '../types';
import { FilterEbookDto } from './dto/filter-ebook.dto';
import { Ebook } from './entities/ebook.entity';
import { FileFieldsInterceptor } from '@nestjs/platform-express';
import { multerStorage, storageDir } from '../utils/storage';
import * as path from 'path';
import { Serialize } from '../interceptors/serialize.interceptor';
import { EbookDto } from './dto/ebook.dto';
import { AuthGuard } from '@nestjs/passport';
import { Roles } from '../decorators/roles.decorator';
import { RolesGuard } from '../guards/roles.guard';

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
  @Serialize(EbookDto)
  @Get('/filter')
  async findMany(@Query() query: FilterEbookDto) {
    console.log(query);

    return await this.ebooksService.filter(query);
  }

  @Get('/photo/:id')
  async getPhoto(
    @Param('id') id: string,
    @Res() res: any
  ): Promise<any> {
    return await this.ebooksService.getPhoto(id, res);
  }

  @Patch('/update/:id')
  @Roles('admin')
  @UseGuards(AuthGuard('jwt'), RolesGuard)
  @UseInterceptors(
    FileFieldsInterceptor([
      {
        name: 'cover', maxCount: 10,
      },
    ], { storage: multerStorage(path.join(storageDir(), 'book-covers')) },
    ),
  )
  update(
    @Param('id') id: string,
    @Body() updateEbookDto: UpdateEbookDto,
    @UploadedFiles() files: MulterDiskUploadedFiles,
  ) {
    return this.ebooksService.update(id, updateEbookDto, files);
  }


  @Delete(':id')
  @Roles('admin')
  @UseGuards(AuthGuard('jwt'), RolesGuard)
  remove(@Param('id') id: string) {
    return 'delete done';
    //return this.ebooksService.remove(+id);
  }

  @Post('/add/ebook')
  @Roles('admin')
  @UseGuards(AuthGuard('jwt'), RolesGuard)
  @UseInterceptors(
    FileFieldsInterceptor([
      {
        name: 'cover', maxCount: 10,
      },
    ], { storage: multerStorage(path.join(storageDir(), 'book-covers')) },
    ),
  )
  addEbook(
    @Body() req: AddEbookDto,
    @UploadedFiles() files: MulterDiskUploadedFiles,
  ) {
    return this.ebooksService.addEbook(req, files);
  }

}
