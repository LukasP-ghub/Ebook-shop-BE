import { PartialType } from '@nestjs/mapped-types';
import { CreateAuthorDto } from './create-author.dto';
import { AuthorDto } from './author.dto';

export class UpdateAuthorDto extends PartialType(AuthorDto) { }
