import * as express from "express";
import * as cors from 'cors';
import 'express-async-errors';
import { ebookRouter } from "./routers/ebook";
import { handleError } from "./utils/errors";
import './utils/db';

const app = express();

app.use(cors({
    origin: 'http://localhost:3000',
}));
app.use(express.json()); // Content-type: application/json

app.use('/ebooks', ebookRouter);

app.use(handleError);

app.listen(3001, '0.0.0.0', () => {
    console.log('Listening');
});
