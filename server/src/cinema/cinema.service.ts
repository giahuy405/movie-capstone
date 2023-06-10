import { Injectable } from '@nestjs/common';
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
     const res = await this.prisma.cinemaSystem.findFirst({
      where:{
        cinemaSystem_id:Number(id)
      }
     });
     return res;
  }
  async getInfoCinemaGroup(id:string) {
    const res = await this.prisma.cinemaGroup.findMany({
     where:{
       cinemaSystem_id:Number(id)
     }
    });
    return res;
 }
   
}
