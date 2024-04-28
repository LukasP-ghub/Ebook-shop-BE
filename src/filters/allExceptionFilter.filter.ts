import { ArgumentsHost, Catch, ExceptionFilter, HttpException } from '@nestjs/common';
import { Request, Response } from 'express';

@Catch()
export class AllExceptionsFilter implements ExceptionFilter {
  catch(exception: any, host: ArgumentsHost) {
    const ctx = host.switchToHttp();
    const response = ctx.getResponse<Response>();
    const request = ctx.getRequest<Request>();
    const status = exception instanceof HttpException ? exception.getStatus() : 500;

    if (exception.code === 'ENOENT') {
      response
        .status(404)
        .json({
          statusCode: 404,
          timestamp: new Date().toISOString(),
          path: request.url,
          message: 'Resource not found',
        });

    } else {
      response
        .status(status)
        .json({
          statusCode: status,
          timestamp: new Date().toISOString(),
          path: request.url,
        });
    }


  }
}