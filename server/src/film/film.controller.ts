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
  UseInterceptors,
  UploadedFile,
} from '@nestjs/common';
import { FilmService } from './film.service';
import { CreateFilmDto } from './dto/create-film.dto';
import { UpdateFilmDto } from './dto/update-film.dto';
import { FileInterceptor } from '@nestjs/platform-express';
import { diskStorage } from 'multer';
import { ApiTags } from '@nestjs/swagger';

@ApiTags('Film manager')
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

  // @UseGuards(AuthGuard('jwt'))
  @UseInterceptors(
    FileInterceptor('image', {
      storage: diskStorage({
        destination: process.cwd() + '/public/images',
        filename: (req, file, cb) => {
          console.log(file);
          cb(null, Date.now() + '_' + file.originalname);
        },
      }),
    }),
  )
  @Post('upload-film/:filmId')
  uploadAvatar(@UploadedFile() 
     file: Express.Multer.File,
     @Param("filmId") filmId:string)
    {
    return this.filmService.uploadAvatar(filmId,file);
  }

  @Delete('delete-film/:filmId')
  deleteFilm(  @Param("filmId") filmId:string) {
    return this.filmService.deleteFilm(filmId);
  }

  @Get('get-info-film/:filmId')
  getInfoFilm(  @Param("filmId") filmId:string) {
    return this.filmService.getInfoFilm(filmId);
  }

}
