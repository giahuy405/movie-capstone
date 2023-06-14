import {
  Controller,
  Get,
  Post,
  Body,
  Param,
  Delete,
  ParseIntPipe,
  Query,
  UseGuards,
  Req,
  Put,
} from '@nestjs/common';
import { UserService } from './user.service';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { AuthGuard } from '@nestjs/passport';
import { users } from '@prisma/client';
import { FileInterceptor } from '@nestjs/platform-express';
import { diskStorage } from 'multer';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
@ApiTags('User manager')
@Controller('user-manager')
export class UserController {
  constructor(private readonly userService: UserService) {}

  @ApiBearerAuth()
  @UseGuards(AuthGuard('jwt'))
  @Get('get-user-type')
  getUserType() {
    return this.userService.getUserType();
  }

  @Get('user-list')
  getListUser(@Body() createUserDto: CreateUserDto) {
    return this.userService.getListUser();
  }

  @Get('user-list-pagination/:page/:pageSize')
  getListUserPagination(
    @Param('page', ParseIntPipe) page: number,
    @Param('pageSize', ParseIntPipe) pageSize: number,
  ) {
    return this.userService.getListUserPagination(page, pageSize);
  }

  @Get('search-user')
  searchUser(@Query('term') term: string) {
    return this.userService.searchUser(term);
  }

  @Get('search-user-pagination')
  searchUserPagination(
    @Query('term') term: string,
    @Query('page', ParseIntPipe) page: number,
    @Query('pageSize', ParseIntPipe) pageSize: number,
  ) {
    return this.userService.searchUserPagination(term, page, pageSize);
  }

  // not done, also the info-account
  @ApiBearerAuth()
  @UseGuards(AuthGuard('jwt'))
  @Post('info-user')
  infoUser(@Req() req: Request) {
    return this.userService.infoUser(req);
  }
  @ApiBearerAuth()
  @UseGuards(AuthGuard('jwt'))
  @Post('add-user')
  addUser(@Req() req: Request, @Body() users: users) {
    return this.userService.addUser(req, users);
  }
  @ApiBearerAuth()
  @UseGuards(AuthGuard('jwt'))
  @Put('update-info-user')
  updateInfoUser(@Req() req: Request, @Body() users: users) {
    return this.userService.updateInfoUser(req, users);
  }
  @ApiBearerAuth()
  @UseGuards(AuthGuard('jwt'))
  @Delete('delete-user/:email')
  deleteUser(@Req() req: Request, @Param('email') email: string) {
    return this.userService.deleteUser(email, req);
  }
}
