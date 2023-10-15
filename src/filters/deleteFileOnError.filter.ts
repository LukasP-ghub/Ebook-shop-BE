import {
  ExceptionFilter,
  Catch,
  ArgumentsHost,
  BadRequestException,
} from '@nestjs/common';
import { Request, Response } from 'express';
import * as fs from 'fs';
import * as path from 'path';
import { storageDir } from '../utils/storage';

@Catch(BadRequestException)
export class DeleteFileOnErrorFilter implements ExceptionFilter {
  catch(exception: BadRequestException, host: ArgumentsHost) {
    const ctx = host.switchToHttp();
    const response = ctx.getResponse<Response>();
    const request = ctx.getRequest<Request>();
    const status = exception.getStatus();

    const getFiles = (files: Express.Multer.File[] | unknown | undefined) => {
      if (!files) return [];
      if (Array.isArray(files)) return files;
      return Object.values(files);
    };

    const filePaths = getFiles(request.files).flat();

    try {
      if (filePaths) {
        filePaths.forEach((item) => {
          fs.unlink(path.join(storageDir(), 'book-covers', item.filename), (err) => {
            if (err) throw err;
            console.log(`file ${item.filename} was deleted`);
          });
        })

      }
    } catch (error2) {
      throw error2
    }

    response.status(status).json(exception.getResponse());
  }
}