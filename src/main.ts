import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { setupApp } from './setup-app';
import { ValidationPipe } from '@nestjs/common';
import * as cookieParser from 'cookie-parser';
import { COOKIE_SECRET } from './config/secrets';


async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  setupApp(app);
  // app.enableCors({
  //   allowedHeaders: ['content-type'],
  //   origin: 'http://localhost:3000',
  //   credentials: true,
  // });

  // app.useGlobalPipes(new ValidationPipe({
  //   whitelist: true,
  //   forbidNonWhitelisted: true,
  //   transform: true,
  //   transformOptions: {
  //     enableImplicitConversion: true,
  //     excludeExtraneousValues: true,
  //     exposeUnsetFields: false,
  //   }
  // }));
  // app.use(cookieParser(COOKIE_SECRET));
  await app.listen(3001);
}
bootstrap();
