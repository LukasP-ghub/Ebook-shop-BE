import { pool } from "../utils/db";
import { ValidationError } from "../utils/errors";
import { v4 as uuid } from "uuid";
import { FieldPacket } from "mysql2";
import { UserEntity } from "../types/user";

type UserEntityResults = [UserEntity[], FieldPacket[]];

export class UserRecord implements UserEntity {
  public user_id: string;
  public password: string;
  public email: string;

  constructor(obj: UserEntity) {
    this.user_id = obj.user_id;
    this.password = obj.password;
    this.email = obj.email;
  }

  static async save({ user_id, email, password }: UserEntity) {
    const user = new UserRecord({
      user_id,
      email,
      password,
    });

    await pool.execute(
      `INSERT INTO customer (id, email, password) VALUES(:id, :email, :password)`,
      {
        user_id,
        email,
        password,
      }
    );

    return user;
  }

  static async findOne({ email }: { email: string }) {
    const [results] = await pool.execute(
      `SELECT customer.id, customer.email, customer.password
      FROM customer 
      WHERE customer.email= :email
      ;`,
      {
        email,
      }
    ) as UserEntityResults;

    return results.length === 0 ? null : new UserRecord(results[0]);
  }

  static async findById({ id }: { id: string }) {
    const [results] = await pool.execute(
      `SELECT customer.id, customer.email, customer.password
      FROM customer 
      WHERE customer.id= :id
      ;`,
      {
        id,
      }
    ) as UserEntityResults;

    return results.length === 0 ? null : new UserRecord(results[0]);
  }
}