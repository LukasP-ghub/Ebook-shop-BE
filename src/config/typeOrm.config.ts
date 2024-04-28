import { TypeOrmModuleOptions } from '@nestjs/typeorm';

const TYPEORM_CONFIG: TypeOrmModuleOptions = {
  type: 'mysql',
  host: 'localhost',
  port: 3306,
  username: 'root',
  password: '',
  entities: [__dirname + '/../**/*.entity.{js,ts}'],
  bigNumberStrings: false,
  logging: true,
  synchronize: false,
};

switch (process.env.NODE_ENV) {
  case 'test':
    Object.assign(TYPEORM_CONFIG, {
      database: 'wobclone_test',
    });
    break;
  case 'development':
    Object.assign(TYPEORM_CONFIG, {
      database: 'wobclone',
    });
    break;
  case 'production':
    Object.assign(TYPEORM_CONFIG, {
      database: 'wobclone',
    });
    break;
  default:
    throw new Error('No database specified for this environment');
}

export default TYPEORM_CONFIG;