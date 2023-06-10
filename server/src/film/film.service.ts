import { HttpException, Injectable } from '@nestjs/common';
import { CreateFilmDto } from './dto/create-film.dto';
import { UpdateFilmDto } from './dto/update-film.dto';
import { Prisma, PrismaClient } from '@prisma/client';
import { ConfigService } from '@nestjs/config';
import { JwtService } from '@nestjs/jwt';

@Injectable()
export class FilmService {
  constructor(
    private jwtService: JwtService,
    private configService: ConfigService,
  ) {}

  private prisma = new PrismaClient();

  async bannerList() {
    const banners = this.prisma.banner.findMany();
    return banners;
  }
  async listFilm(term: string) {
    try {
      let films;
      if (!term) {
        films = await this.prisma.film.findMany();
      } else {
        films = await this.prisma.film.findMany({
          where: {
            name: { contains: term.toLowerCase() },
          },
        });
      }

      return { message: 'Successfully ', data: films };
    } catch (err) {
      throw new HttpException('Failed', 400);
    }
  }
  async listFilmPagination(term: string, page: number, pageSize: number) {
    try {
      const query = {
        where: {} as any,
        take: +pageSize,
        skip: (+page - 1) * +pageSize,
      };
      if (term && term.trim() !== '') {
        query.where.name = { contains: term.toLowerCase() };
      }
      const [films, totalCount] = await Promise.all([
        this.prisma.film.findMany(query),
        this.prisma.film.count({ where: query.where }),
      ]);
      return {
        message: 'Successfully',
        data: films,
        totalCount,
      };
    } catch (err) {
      console.error('Failed to retrieve films:', err);
      throw new Error('Failed to retrieve films');
    }
  }
  async listFilmByDate(
    term: string,
    page: number,
    pageSize: number,
    fromDay: string,
    toDay: string,
  ) {
    try {
      const skip = (+page - 1) * +pageSize;

      // Create the filter object for the date range
      const dateFilter: any = {};
      // remember to create new Date here
      if (fromDay) {
        dateFilter.gte = new Date(fromDay);
      }
      if (toDay) {
        dateFilter.lte = new Date(toDay);
      }

      // Query films based on the provided parameters
      if (term) {
        const films = await this.prisma.film.findMany({
          where: {
            name: { contains: term },
            release_day: dateFilter,
          },
          skip,
          take: +pageSize,
        });
        return { message: 'Successfully', data: films };
      } else {
        const films = await this.prisma.film.findMany({
          where: {
            release_day: dateFilter,
          },
          skip,
          take: +pageSize,
        });
        return { message: 'Successfully', data: films };
      }
    } catch (error) {
      throw new Error('Failed to retrieve films');
    }
  }

  // also upload and update
  async uploadAvatar(filmId: string, file: Express.Multer.File) {
    const film = await this.prisma.film.findFirst({
      where: {
        film_id: Number(filmId),
      },
    });
    // thay path
    film.image = file.filename;

    // lưu vào db
    await this.prisma.film.update({
      data: film,
      where: {
        film_id: Number(filmId),
      },
    });
    return { message: 'Upload Successfully' };
  }
  async deleteFilm(filmId: string) {
    const data = await this.prisma.film.delete({
      where: {
        film_id: Number(filmId),
      },
    });
    return { message: 'Delete Successfully', data };
  }

  async getInfoFilm(filmId: string) {
    const data = await this.prisma.film.findFirst({
      where: {
        film_id: Number(filmId),
      },
    });
    return { message: 'Delete Successfully', data };
  }
}
