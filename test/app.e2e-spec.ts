import { Test, TestingModule } from '@nestjs/testing';
import { INestApplication } from '@nestjs/common';
import * as request from 'supertest';
import { AppModule } from './../src/app.module';

describe('Auth system (e2e)', () => {
  let app: INestApplication;

  beforeEach(async () => {
    const moduleFixture: TestingModule = await Test.createTestingModule({
      imports: [AppModule],
    }).compile();

    app = moduleFixture.createNestApplication();
    await app.init();
  });

  it('Handle signup request', () => {
    const email = 'sasqasa@asdsd.pl';
    return request(app.getHttpServer())
      .post('/user/create')
      .send({ email, pwd: 'dsdfsdfsdf' })
      .expect(201)
      .then((res) => {
        const { user_id, email } = res.body;
        expect(user_id).toBeDefined();
        expect(email).toEqual(email);
      })
  });
});
