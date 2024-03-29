import { ValidationPipe } from '@nestjs/common';
import * as cookieParser from 'cookie-parser';
import { COOKIE_SECRET } from './config/secrets';
import { AllExceptionsFilter } from './filters/allExceptionFilter.filter';

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

  //app.useGlobalFilters(new AllExceptionsFilter());

  app.use(cookieParser(COOKIE_SECRET));
  app.getHttpServer().setTimeout(10000);
}