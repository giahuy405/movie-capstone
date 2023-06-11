import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { CinemaModule } from './cinema/cinema.module';
import { FilmModule } from './film/film.module';
import { UserModule } from './user/user.module';
import { BookTicketModule } from './book-ticket/book-ticket.module';
import { ConfigModule } from '@nestjs/config';
import { AuthModule } from './auth/auth.module';
import { JwtModule } from '@nestjs/jwt';
@Module({
  imports: [AuthModule, BookTicketModule, UserModule, FilmModule, CinemaModule,ConfigModule.forRoot({ isGlobal: true }), 
  JwtModule.register({global:true})],
  controllers: [AppController],
  providers: [AppService],
})

export class AppModule {}
