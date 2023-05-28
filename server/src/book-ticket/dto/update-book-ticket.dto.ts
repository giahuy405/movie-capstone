import { PartialType } from '@nestjs/mapped-types';
import { CreateBookTicketDto } from './create-book-ticket.dto';

export class UpdateBookTicketDto extends PartialType(CreateBookTicketDto) {}
