import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import * as express from 'express';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  // enable CORS
  app.enableCors();
  app.use(express.static('.')); // định nghĩa đường dẫn file

  // LINK ERD
  // https://lucid.app/lucidchart/6c7fb76f-ceab-4757-85d6-22d2d6c172ef/view?page=0_0&invitationId=inv_0041c718-65db-4cdb-a705-3bdb1b8f74c0#

  const config = new DocumentBuilder().setTitle('Swagger movie API').setVersion('1.1').setDescription('Swagger movie').addBearerAuth().build();
  const document = SwaggerModule.createDocument(app,config);
  SwaggerModule.setup('/swagger',app,document); // localhost:5555/swagger

  await app.listen(5555);
}
bootstrap();
