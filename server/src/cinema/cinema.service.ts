import { HttpException, Injectable } from '@nestjs/common';
import { CreateCinemaDto } from './dto/create-cinema.dto';
import { UpdateCinemaDto } from './dto/update-cinema.dto';
import { JwtService } from '@nestjs/jwt';
import { ConfigService } from '@nestjs/config';
import { PrismaClient } from '@prisma/client';

@Injectable()
export class CinemaService {
  constructor(
    private jwtService: JwtService,
    private configService: ConfigService,
  ) {}
  private prisma = new PrismaClient();


  async getInfoCinemaSystem(id:string) {
   try{
    const res = await this.prisma.cinemaSystem.findFirst({
      where:{
        cinemaSystem_id:Number(id)
      }
     });
     if(!res) {
      throw new HttpException('Failed', 400);
     }

     return res;
   }catch(err){
    throw new HttpException('Failed', 400);
   }
  }
  async getInfoCinemaGroup(id:string) {
    try{
      const res = await this.prisma.cinemaGroup.findMany({
        where:{
          cinemaSystem_id:Number(id)
        }
       });
       if(!res) {
         throw new HttpException('Failed', 400);
        }
       return res;
    }catch(err){
      throw new HttpException('Failed', 400);
    }
 }
 async getInfoShowtimesFilm(filmId: string) {
  const data = await this.prisma.film.findFirst({
    where: {
      film_id: Number(filmId),
    },
  });
  const dataShowtimes = await this.prisma.showtimes.findMany({
    where:{
      film_id: Number(filmId),
    }
  });
  return { message: ' Successfully', data };
}
}
