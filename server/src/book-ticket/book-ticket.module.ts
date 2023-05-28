import { Module } from '@nestjs/common';
import { BookTicketService } from './book-ticket.service';
import { BookTicketController } from './book-ticket.controller';

@Module({
  controllers: [BookTicketController],
  providers: [BookTicketService]
})
export class BookTicketModule {}
