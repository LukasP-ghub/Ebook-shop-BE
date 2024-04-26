import { NestFactory } from '@nestjs/core';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';
import { AppModule } from './app.module';
import { setupApp } from './setup-app';


async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  setupApp(app);

  const config = new DocumentBuilder()
    .setTitle('Ebook store API description')
    .setDescription('Description of the API for the ebook store application')
    .setVersion('0.5')
    .addTag('ebooks')
    .build();
  const document = SwaggerModule.createDocument(app, config);
  SwaggerModule.setup('api', app, document);
  await app.listen(3001);
}
bootstrap();
