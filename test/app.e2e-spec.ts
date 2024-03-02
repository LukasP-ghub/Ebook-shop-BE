import { Test, TestingModule } from '@nestjs/testing';
import { INestApplication } from '@nestjs/common';
import * as request from 'supertest';
import * as path from 'path';
import { AppModule } from './../src/app.module';
import { Ebook } from './../src/ebooks/entities/ebook.entity'
import { setupApp } from '../src/setup-app';
import { AddEbookDto } from '../src/ebooks/dto/add-ebook.dto';
import { storageDir } from '../src/utils/storage';
import { v4 as uuid } from 'uuid';



describe('App test (e2e)', () => {
  let app: INestApplication;
  const email = 'test@test.pl';
  const pwd = 'qwerty';
  let adminLoginCookie;

  beforeEach(async () => {
    const moduleFixture: TestingModule = await Test.createTestingModule({
      imports: [AppModule],
    }).compile();

    app = moduleFixture.createNestApplication();
    setupApp(app);
    await app.init();
  });

  // it('Handle Sign Up request', () => {

  //   return request(app.getHttpServer())
  //     .post('/user/create')
  //     .send({ email, pwd })
  //     .then((res) => {
  //       console.log(res.body);

  //       const { user_id, email } = res.body;
  //       expect(user_id).toBeDefined();
  //       expect(email).toEqual(email);
  //     })
  // });

  it('Handle Sign In request', () => {

    return request(app.getHttpServer())
      .post('/auth/login')
      .send({ email, pwd })
      .expect(201)
      .then((response) => {
        expect(response.body).toHaveProperty('ok');
        expect(response.body.ok).toBe(true);
        adminLoginCookie = response.header['set-cookie'];
      })
  });

  it('Handle create ebook request', () => {
    const matchEbook = new Ebook();
    const ebook: AddEbookDto = {
      title: 'test',
      pages: 100,
      publication_date: '2010-05-20',
      description: 'lorem',
      price: 20.99,
      language: {
        "language_name": "lol",
        "language_code": "l",
        language_id: uuid()
      },
      publisher: {
        "publisher_name": "blol",
        publisher_id: uuid()
      },
      author: [
        {
          "author_id": uuid(),
          "author_name": "Jerzy Bowak"
        },
        {
          "author_id": uuid(),
          "author_name": "Artur Nosowski"
        }
      ],
      category: [
        {
          "category_id": uuid(),
          "category_name": "zonk",
          "popular": true
        }
      ],
      discount: [
        {
          "discount_id": uuid(),
          "discount_name": "lol",
          "discount_value": 0.2
        }
      ]
    }

    return request(app.getHttpServer())
      .post('/ebooks/add/ebook')
      .set("Cookie", adminLoginCookie)
      .set('Connection', 'keep-alive')
      .attach('cover', path.join(storageDir(), 'book-covers', 'blue-butterfly-small.jpg'))
      .field('title', ebook.title)
      .field('pages', ebook.pages)
      .field('publication_date', ebook.publication_date)
      .field('description', ebook.description)
      .field('price', ebook.price)
      .field('language', JSON.stringify(ebook.language))
      .field('publisher', JSON.stringify(ebook.publisher))
      .field('author', JSON.stringify(ebook.author))
      .field('category', JSON.stringify(ebook.category))
      .field('discount', JSON.stringify(ebook.discount))
      .expect(201)
      .then((res) => {
        expect(res.body).toMatchObject(matchEbook);
      })
  });

  // it('Handle GET ebook request', () => {
  //   const params = {
  //     phrase: 'test',
  //   }

  //   const matchEbook = new Ebook();

  //   //return undefined;
  //   return request(app.getHttpServer())
  //     .get('/ebooks/filter')
  //     .query(params)
  //     .then((res) => {
  //       //console.log(res.body);

  //       expect(res.body).toMatchObject([matchEbook]);
  //     })
  // });

  // afterAll(async () => {
  //   await app.close();
  // });
});