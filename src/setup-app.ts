import { ValidationPipe } from '@nestjs/common';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';
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

  const config = new DocumentBuilder()
    .setTitle('Ebook store API description')
    .setDescription('Description of the API for the ebook store application')
    .setVersion('0.5')
    .addTag('ebooks')
    .build();
  const document = SwaggerModule.createDocument(app, config);
  SwaggerModule.setup('api', app, document);

  //app.useGlobalFilters(new AllExceptionsFilter());

  app.use(cookieParser(COOKIE_SECRET));
  app.getHttpServer().setTimeout(10000);
}