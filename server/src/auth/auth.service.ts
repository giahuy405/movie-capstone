import { HttpException, Injectable } from '@nestjs/common';
import { PrismaClient } from '@prisma/client';
import { JwtService } from '@nestjs/jwt';
import { ConfigService } from '@nestjs/config';
import { UserLogin, UserSignup } from './entities/auth.entity';
import * as bcrypt from 'bcrypt';
@Injectable()
export class AuthService {
  constructor(
    private jwtService: JwtService,
    private configService: ConfigService,
  ) {}

  private prisma = new PrismaClient();

  async login(userLogin: UserLogin): Promise<any> {
    const { email, password } = userLogin;
    let checkUser = await this.prisma.users.findFirst({
      where: {
        email,
      },
    });
    let checkPass = bcrypt.compareSync(password, checkUser.password);
    if (checkUser) {
      if (checkPass) {
        // generate token
        let token = this.jwtService.signAsync(
          { data: checkUser },
          {
            expiresIn: '3y',
            secret: this.configService.get('SECRET_KEY'),
          },
        );
        return token
      }
    }
    throw new HttpException('Email hoặc mật khẩu ko đúng', 400);
  }

  async signUp(userSignup: UserSignup) {
    const { email, password, fullname, avatar, phoneNumber, user_type } =
      userSignup;

    // check user trùng email
    let checkUser = await this.prisma.users.findFirst({
      where: {
        email,
      },
    });
    if (checkUser) {
      throw new HttpException('Email đã tồn tại', 400);
    }

    // Hash the password
    const hashedPassword = await bcrypt.hash(password, 10);
    const newData = {
      email,
      fullname,
      avatar,
      phoneNumber,
      user_type: 'normal',
      password: hashedPassword,
    };
    const savedUser = await this.prisma.users.create({ data: newData });
    return savedUser;
  }
}
