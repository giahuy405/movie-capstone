import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { CinemaService } from './cinema.service';
import { CreateCinemaDto } from './dto/create-cinema.dto';
import { UpdateCinemaDto } from './dto/update-cinema.dto';

@Controller('cinema-manager')
export class CinemaController {
  constructor(private readonly cinemaService: CinemaService) {}
  @Get('get-info-cinema-sys/:id')
  getInfoCinemaSystem(@Param('id') id: string) {
    return this.cinemaService.getInfoCinemaSystem(id);
  }

  @Get('get-info-cinema-group/:id')
  getInfoCinemaGroup(@Param('id') id: string) {
    return this.cinemaService.getInfoCinemaGroup(id);
  }

  @Get('get-info-showtimes-film/:filmId')
  getInfoShowtimesFilm(  @Param("filmId") filmId:string) {
    return this.cinemaService.getInfoShowtimesFilm(filmId);
  }
}
