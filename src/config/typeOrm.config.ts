import { TypeOrmModuleOptions } from '@nestjs/typeorm';

export const TYPEORM_CONFIG: TypeOrmModuleOptions = {
  type: 'mysql',
  host: 'localhost',
  port: 3306,
  username: 'root',
  password: '',
  database: process.env.NODE_ENV === 'test' ? 'wobclone_test' : 'wobclone',
  //database: 'wobclone_test',
  //entities: ['dist/**/**.entity{.ts,.js}'],
  entities: [__dirname + '/../**/*.entity.{js,ts}'],
  bigNumberStrings: false,
  logging: true,
  synchronize: false,
};