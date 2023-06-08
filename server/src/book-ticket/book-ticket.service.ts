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
    // lấy thông tin email ra từ thằng token dc FE gửi lên
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


      
      if (!showtimes) {
        throw new Error('Không tìm thấy lịch chiếu (showtimes)');
      }

      const bookTicket_Records = [];
      // lấy từng vé trong mảng ra 
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
    const errors = {
      film_id:'',
      showing_times:"",
      cinema_id:"",
      ticket_price:""
    };

    if(!film_id || !showing_times || !cinema_id || !ticket_price){
      if (!film_id) errors.film_id = "Mã phim không được bỏ trống!!";
      if (!showing_times) errors.showing_times = "Ngày giờ chiếu không được bỏ trống!";
      if (!cinema_id) errors.cinema_id = "Mã rạp không được bỏ trống!";
      if (!ticket_price) errors.ticket_price = "Giá vé không được bỏ trống!";
      return  { message: 'Fail' , errors };
    }

    const film_idExist = await this.prisma.film.findFirst({
      where:{
        film_id: parseInt(film_id)
      }
    })
    if(!film_idExist) return { message: 'Fail', error : 'Không tồn tại id film'};
    const cinema_idExist = await this.prisma.cinema.findFirst({
      where:{
        cinema_id:parseInt(cinema_id)
      }
    })
    if(!cinema_idExist) return { message: 'Fail', error : 'Không tồn tại id cinema'};


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
