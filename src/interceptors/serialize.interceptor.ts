import {
  UseInterceptors,
  NestInterceptor,
  ExecutionContext,
  CallHandler,
} from '@nestjs/common';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { plainToInstance } from 'class-transformer';

interface ClassConstructor {
  new(...args: any[]): {}
}

export function Serialize<T extends ClassConstructor>(dto: T) {
  return UseInterceptors(new SerializeInterceptor(dto));
}

class SerializeInterceptor<U extends ClassConstructor> implements NestInterceptor {
  constructor(private dto: U) { }

  intercept(context: ExecutionContext, handler: CallHandler): Observable<any> {
    return handler.handle().pipe(
      map((data: any) => {
        return plainToInstance(this.dto, data, {
          excludeExtraneousValues: true,
          //enableImplicitConversion: true
        });
      }),
    );
  }
}
