import { EbookDto } from "./ebook.dto";
import { OmitType } from "@nestjs/mapped-types";

export class AddEbookDto extends OmitType(EbookDto, ['ebook_id', 'cover'] as const) {
}
