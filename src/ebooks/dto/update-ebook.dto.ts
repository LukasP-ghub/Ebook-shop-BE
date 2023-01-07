import { PartialType } from '@nestjs/mapped-types';
import { AddEbookDto } from './add-ebook.dto';

export class UpdateEbookDto extends PartialType(AddEbookDto) { }
