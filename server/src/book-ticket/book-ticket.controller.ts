import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
  UseGuards,
  Req,
} from '@nestjs/common';
import { BookTicketService } from './book-ticket.service';
import { CreateBookTicketDto } from './dto/create-book-ticket.dto';
import { UpdateBookTicketDto } from './dto/update-book-ticket.dto';
import { AuthGuard } from '@nestjs/passport';
import { JwtService } from '@nestjs/jwt';
import { BookTicket, CreateShowtimes } from './entities/book-ticket.entity';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';

@ApiTags('Booking manager')
@Controller('book-ticket-manager')
export class BookTicketController {
  constructor(
    private readonly bookTicketService: BookTicketService,
    private jwtService: JwtService,
  ) {}

  @ApiBearerAuth()
  @UseGuards(AuthGuard('jwt'))
  @Get('get-all-user')
  findAll() {
    return this.bookTicketService.findAll();
  }

  @ApiBearerAuth()
  @UseGuards(AuthGuard('jwt'))
  @Get('get-all-user2')
  findAllUser(@Req() req: Request) {
    return this.bookTicketService.findAllUser(req);
  }

  @ApiBearerAuth()
  @UseGuards(AuthGuard('jwt'))
  @Post('book-ticket')
  BookTicket(@Req() req: Request, @Body() body) {
    return this.bookTicketService.bookTicket(req, body);
  }

  @Get('get-cinema-list')
  getCinemaList(@Req() req: Request, @Body() body) {
    return this.bookTicketService.getCinemaList(req, body);
  }

  @ApiBearerAuth()
  @UseGuards(AuthGuard('jwt'))
  @Post('create-showtimes')
  createShowTimes(@Req() req: Request, @Body() body) {
    return this.bookTicketService.createShowTimes(req, body);
  }
}
