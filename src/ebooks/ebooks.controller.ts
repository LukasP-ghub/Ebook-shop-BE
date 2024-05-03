import { Body, Controller, Delete, Get, Param, Patch, Post, Query, Res, UploadedFiles, UseFilters, UseGuards, UseInterceptors } from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { FileFieldsInterceptor } from '@nestjs/platform-express';
import { ApiOperation, ApiResponse, ApiTags } from '@nestjs/swagger';
import { Roles } from '../decorators/roles.decorator';
import { UserObj } from '../decorators/user-obj.decorator';
import { DeleteFileOnErrorFilter } from '../filters/deleteFileOnError.filter';
import { RolesGuard } from '../guards/roles.guard';
import { MulterDiskUploadedFiles } from '../types';
import { User } from '../user/entities/user.entity';
import { multerStorage } from '../utils/storage';
import { AddEbookDto } from './dto/add-ebook.dto';
import { FilterEbookDto } from './dto/filter-ebook.dto';
import { UpdateEbookDto } from './dto/update-ebook.dto';
import { EbooksService } from './ebooks.service';

@ApiTags('ebooks')
@Controller('ebooks')
export class EbooksController {
  constructor(private readonly ebooksService: EbooksService) { }

  //@Serialize(EbookDto)
  @ApiOperation({
    summary: 'GET -  filer ebooks',
  })
  @ApiResponse({
    status: 200,
    description: 'Return filtered ebooks',
    schema: { type: 'array', items: { type: 'object' } }
  })
  //@ApiQuery({ type: FilterEbookDto })
  @Get('/filter')
  async filter(@Query() query: FilterEbookDto) {
    return await this.ebooksService.filter(query);
  }

  @Get('/file/photo/:id')
  async getPhoto(
    @Param('id') id: string,
    @Res() res: any
  ): Promise<any> {
    return await this.ebooksService.getPhoto(id, res);
  }

  @Get('/file/ebook/:id')
  @Roles('user')
  @UseGuards(AuthGuard('jwt'), RolesGuard)
  async getEbookFile(
    @Param('id') id: string,
    @Res() res: any,
    @UserObj() user: User
  ): Promise<any> {
    return await this.ebooksService.getEbookFile(id, user, res);
  }

  @Patch('/update/:id')
  @Roles('admin')
  @UseGuards(AuthGuard('jwt'), RolesGuard)
  @UseInterceptors(
    FileFieldsInterceptor([
      {
        name: 'cover', maxCount: 10,
      },
    ], { storage: multerStorage() },
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
      {
        name: 'product', maxCount: 1,
      },
    ], { storage: multerStorage() },
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
