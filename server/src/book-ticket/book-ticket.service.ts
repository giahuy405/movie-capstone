import { HttpException, Injectable, NotFoundException } from '@nestjs/common';
import { CreateBookTicketDto } from './dto/create-book-ticket.dto';
import { UpdateBookTicketDto } from './dto/update-book-ticket.dto';
import { Prisma, PrismaClient } from '@prisma/client';
import { JwtService } from '@nestjs/jwt';
import { BookTicket, CreateShowtimes } from './entities/book-ticket.entity';

@Injectable()
export class BookTicketService {
  constructor(private jwtService: JwtService) {}

  private prisma = new PrismaClient();

  async findAll() {
    const data = await this.prisma.users.findMany();
    return data;
  }
  async findAllUser(req: Request) {
    // in typescript dont have authorization in header so do this
    const headers = req.headers as { authorization?: string };
    const token = headers.authorization?.split(' ')[1];

    const decodedToken = this.jwtService.decode(token);
    let data;
    if (typeof decodedToken === 'object' && decodedToken !== null) {
      data = decodedToken.data;
      return data;
    } else {
      throw new Error('Failed JWT');
    }
  }
  async bookTicket(req: Request, body) {
    const { showtimes_id, list_ticket } = body;

    const headers = req.headers as { authorization?: string };
    const token = headers.authorization?.split(' ')[1];
    const decodedToken = this.jwtService.decode(token);
    if (typeof decodedToken === 'object' && decodedToken !== null) {
      let infoUser = decodedToken.data;

      const showtimes = await this.prisma.showtimes.findFirst({
        where: {
          showtimes_id 
        }
      });
      console.log("🚀 ~ file: book-ticket.service.ts:46 ~ BookTicketService ~ bookTicket ~ showtimes:", showtimes)
      
      if (!showtimes) {
        throw new Error('Không tìm thấy lịch chiếu (showtimes)');
      }

      const bookTicket_Records = [];
      for (const ticket of list_ticket) {
        const { seat_id, ticket_price } = ticket;
        const seat = await this.prisma.seat.findFirst({ where: { seat_id } });
        if (!seat) {
          throw new Error('Seat not found');
        }

        const createBook_Ticket = await this.prisma.book_ticket.create({
          data: {
            users: { connect: { email: infoUser.email } },
            showtimes: { connect: { showtimes_id } },
            seat: { connect: { seat_id } },
            ticket_price: String(ticket_price),
          },
        });
        bookTicket_Records.push(createBook_Ticket);
      }
      return { message: 'Successfully', bookTicket_Records };
    } else {
      throw new HttpException('Failed JWT', 400);
    }
  }
  async createShowTimes(req: Request, body) {
    const { film_id, showing_times, cinema_id, ticket_price } = body;

    const saved = await this.prisma.showtimes.create({
      data: {
        film: { connect: { film_id: parseInt(film_id) } },
        cinema: { connect: { cinema_id: parseInt(cinema_id) } },
        showing_times, // Convert to DateTime type
        ticket_price,
      },
    });
    return { message: 'Successfully', data: saved };
  }
}
