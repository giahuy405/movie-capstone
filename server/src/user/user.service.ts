import { HttpException, Injectable } from '@nestjs/common';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { PrismaClient, users } from '@prisma/client';
import { JwtService } from '@nestjs/jwt';
import * as bcrypt from 'bcrypt';

@Injectable()
export class UserService {
  constructor(private jwtService: JwtService) {}

  private prisma = new PrismaClient();

  async getUserType() {
    return {
      message: 'Successfully',
      data: [
        { user_type: 'normal', user_type_name: 'Khách hàng' },
        { user_type: 'admin', user_type_name: 'Quản trị' },
      ],
    };
  }
  async getListUser() {
    const data = await this.prisma.users.findMany();
    return data;
  }
  async getListUserPagination(page: number, pageSize: number) {
    try {
      const index = (page - 1) * pageSize;
      const data = await this.prisma.users.findMany({
        skip: index,
        take: pageSize,
      });
      if (data.length === 0) return 'Failed';
      return { message: 'Successfully', data };
    } catch (error) {
      console.error('Error occurred:', error);
      throw new Error('Failed to retrieve user pagination');
    }
  }

  async searchUser(term: string) {
    try {
      const users = await this.prisma.users.findMany({
        where: {
          OR: [
            { fullname: { contains: term.toLowerCase() } },
            { email: { contains: term.toLowerCase() } },
          ],
        },
      });

      return { message: 'Successfully retrieved users', data: users };
    } catch (err) {
      throw new Error('Failed to search users');
    }
  }
  async searchUserPagination(term: string, page: number, pageSize: number) {
    try {
      const index = (+page - 1) * +pageSize;
      const users = await this.prisma.users.findMany({
        where: {
          OR: [
            { fullname: { contains: term.toLowerCase() } },
            { email: { contains: term.toLowerCase() } },
          ],
        },
        skip: index,
        take: +pageSize,
      });

      const total = await this.prisma.users.count({
        where: {
          OR: [
            { fullname: { contains: term.toLowerCase() } },
            { email: { contains: term.toLowerCase() } },
          ],
        },
      });
      if (!users) throw new Error('Failed to search users');
      return {
        message: 'Successfully retrieved users',
        data: users,
        total,
        // page,
        // pageSize,
      };
    } catch (err) {
      console.log(err);
      throw new Error('Failed to search users');
    }
  }
  async infoUser(req: Request) {
    const headers = req.headers as { authorization?: string };
    const token = headers.authorization?.split(' ')[1];

    const decodedToken = this.jwtService.decode(token);
    let infoUser;
    if (typeof decodedToken === 'object' && decodedToken !== null) {
      infoUser = decodedToken.data;

      const dataBooking = await this.prisma.book_ticket.findMany();
      let infoBook = [];
      for (let item of dataBooking) {
        const showtimes = await this.prisma.showtimes.findFirst({
          where: {
            showtimes_id: Number(item.showtimes_id),
          },
        });
        let { cinema_id, film_id, showing_times, ticket_price } = showtimes;
        const film = await this.prisma.film.findFirst({
          where: { film_id },
        });
        console.log(film, 'film');
      }

      return {
        message: 'Successfully',
        data: {
          infoUser,
        },
      };
    } else {
      throw new Error('Failed JWT');
    }
  }
  async addUser(req: Request, users: users) {
    let { email, password, fullname, phoneNumber, avatar, user_type } = users;
    // check have the same email
    let checkUser = await this.prisma.users.findFirst({
      where: {
        email,
      },
    });
    if (checkUser) {
      throw new HttpException('Email đã tồn tại', 400);
    }

    const headers = req.headers as { authorization?: string };
    const token = headers.authorization?.split(' ')[1];
    const decodedToken = this.jwtService.decode(token);
    if (typeof decodedToken === 'object' && decodedToken !== null) {
      let data = decodedToken.data;
      // check role user here
      if (data.user_type === 'admin') {
        // Hash the password
        const hashedPassword = await bcrypt.hash(password, 10);
        const newData = {
          email,
          fullname,
          avatar,
          phoneNumber,
          user_type,
          password: hashedPassword,
        };
        const savedUser = await this.prisma.users.create({ data: newData });
        return {
          statusCode: 201,
          message: 'Add Successfully',
          data: savedUser,
        };
      } else {
        throw new HttpException(
          'authorization to add, need admin account',
          400,
        );
      }
    } else {
      throw new HttpException('Failed JWT', 400);
    }
  }
  async updateInfoUser(req: Request, users: users) {
    let { email, password, fullname, phoneNumber, avatar, user_type } = users;

    // Hash the password
    const hashedPassword = await bcrypt.hash(password, 10);
    const newData = {
      fullname,
      avatar,
      phoneNumber,
      user_type,
      password: hashedPassword,
    };
    try {
      const savedUser = await this.prisma.users.update({
        where: {
          email,
        },
        data: newData,
      });
      return {
        statusCode: 200,
        message: 'Update Successfully',
        data: savedUser,
      };
    } catch (err) {
      throw new HttpException('Email đã tồn tại', 400);
    }
  }
  async deleteUser(email: string, req: Request) {
    const headers = req.headers as { authorization?: string };
    const token = headers.authorization?.split(' ')[1];
    const decodedToken = this.jwtService.decode(token);
    if (typeof decodedToken === 'object' && decodedToken !== null) {
      let data = decodedToken.data;
      // check role user here
      if (data.user_type === 'admin') {
        // find user
        const user = await this.prisma.users.findUnique({ where: { email } });
        if (!user) {
          throw new Error('User not found');
        }
        // Delete related records in other tables
        await this.prisma.comment.deleteMany({ where: { email } });
        await this.prisma.book_ticket.deleteMany({ where: { email } });

        // Then delete user table
        await this.prisma.users.delete({ where: { email } });
        return { statusCode: 204, message: 'Delete Successfully', data: user };
      } else {
        throw new HttpException(
          'authorization to delete, need admin account',
          400,
        );
      }
    } else {
      throw new HttpException('Failed JWT', 400);
    }
  }
 
}
