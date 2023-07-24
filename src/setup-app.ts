import { ValidationPipe } from '@nestjs/common';
import * as cookieParser from 'cookie-parser';
import { COOKIE_SECRET } from './config/secrets';

export const setupApp = (app: any) => {
  app.enableCors({
    allowedHeaders: ['content-type'],
    origin: 'http://localhost:3000',
    credentials: true,
  });

  app.useGlobalPipes(new ValidationPipe({
    whitelist: true,
    forbidNonWhitelisted: true,
    transform: true,
    transformOptions: {
      enableImplicitConversion: true,
      excludeExtraneousValues: true,
      exposeUnsetFields: false,
    }
  }));
  app.use(cookieParser(COOKIE_SECRET));
}