import { PartialType } from '@nestjs/mapped-types';
import { PublisherDto } from '../../ebooks/dto/publisher.dto';

export class UpdatePublisherDto extends PartialType(PublisherDto) { }
