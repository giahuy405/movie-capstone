import { ApiProperty } from '@nestjs/swagger';

export class Auth {}

export class UserLogin {
  @ApiProperty()
  email: string;
  @ApiProperty()
  password: string;
}

export class UserSignup {
  @ApiProperty()
  email: string;
  @ApiProperty()
  password: string;
  @ApiProperty()
  fullname: string;
  @ApiProperty()
  phoneNumber: string;
  @ApiProperty()
  avatar: string;
  @ApiProperty()
  user_type: string;
}
