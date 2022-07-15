import { Router } from "express";
import { findUser, register, signIn } from "../controllers/user.controller";
const bcrypt = require('bcrypt');


export const userRouter = Router();

userRouter // /users

  .post("/signin", signIn)

  .post("/register", register)

  .get("/:id", findUser)