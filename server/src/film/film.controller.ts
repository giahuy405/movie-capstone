import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
  Query,
  ParseIntPipe,
} from '@nestjs/common';
import { FilmService } from './film.service';
import { CreateFilmDto } from './dto/create-film.dto';
import { UpdateFilmDto } from './dto/update-film.dto';

@Controller('film-manager')
export class FilmController {
  constructor(private readonly filmService: FilmService) {}

  @Get('banner-list')
  bannerList() {
    return this.filmService.bannerList();
  }

  @Get('list-film')
  listFilm(@Query('term') term: string) {
    return this.filmService.listFilm(term);
  }

  @Get('list-film-pagination')
  listFilmPagination(
    @Query('term') term: string,
    @Query('page', ParseIntPipe) page: number,
    @Query('pageSize', ParseIntPipe) pageSize: number,
  ) {
    return this.filmService.listFilmPagination(term, page, pageSize);
  }

  // {  the request must like this
  //   "term": "search term",
  //   "page": 1,
  //   "pageSize": 10,
  //   "fromDay": "2023-01-01",
  //   "toDay": "2023-12-31"
  // }
  @Get('list-film-by-date')
  listFilmByDate(
    @Query('term') term: string,
    @Query('page', ParseIntPipe) page: number,
    @Query('pageSize', ParseIntPipe) pageSize: number,
    @Query('fromDay') fromDay: string,
    @Query('toDay') toDay: string,
  ) {
    return this.filmService.listFilmByDate(
      term,
      page,
      pageSize,
      fromDay,
      toDay,
    );
  }
}
