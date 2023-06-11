import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { AuthService } from './auth.service';
import { CreateAuthDto } from './dto/create-auth.dto';
import { UpdateAuthDto } from './dto/update-auth.dto';
import { UserLogin, UserSignup } from './entities/auth.entity';
import { ApiTags } from '@nestjs/swagger';
@ApiTags('Authentication')
@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Post('/login')
  login(@Body() body:UserLogin):Promise<any>{
    return this.authService.login(body);
  }

  @Post('/signUp')
  signUp(@Body() body:UserSignup){
    return this.authService.signUp(body);
  }

}
