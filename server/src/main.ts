import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import * as express from 'express';
// import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  // enable CORS
  app.enableCors();
  app.use(express.static('.'));

  // const config = new DocumentBuilder().setTitle('swager nè').addBearerAuth().build();
  // const document = SwaggerModule.createDocument(app,config);
  // SwaggerModule.setup('/swagger',app,document); // localhost:5431/swagger

  await app.listen(5555);
}
bootstrap();
