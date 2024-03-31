import { Controller, Get, Post, Body, Patch, Param, Delete, Query, Res, UseInterceptors, UploadedFiles, UseGuards, UseFilters } from '@nestjs/common';
import { EbooksService } from './ebooks.service';
import { AddEbookDto } from './dto/add-ebook.dto';
import { UpdateEbookDto } from './dto/update-ebook.dto';
import { MulterDiskUploadedFiles } from '../types';
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
import { DeleteFileOnErrorFilter } from '../filters/deleteFileOnError.filter';


@Controller('ebooks')
export class EbooksController {
  constructor(private readonly ebooksService: EbooksService) { }

  //@Serialize(EbookDto)
  @Get('/filter')
  async filter(@Query() query: FilterEbookDto) {
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
    )
  )
  @UseFilters(DeleteFileOnErrorFilter)
  addEbook(
    @Body() req: AddEbookDto,
    @UploadedFiles() files: MulterDiskUploadedFiles,
  ) {
    return this.ebooksService.addEbook(req, files);
  }

}
