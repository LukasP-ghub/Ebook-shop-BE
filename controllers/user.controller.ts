import { Request, Response } from "express";
import { ValidationError } from "../utils/errors";
import { UserRecord } from "../records/user.record";
import { v4 as uuidv4 } from 'uuid';
import asyncHandler from "express-async-handler";
const bcrypt = require('bcrypt');

export const signIn = asyncHandler(async (req: Request, res: Response) => {
  try {
    const user = await UserRecord.findOne({ email: req.body.email });
    if (user) {
      //if password matches
      if (bcrypt.compareSync(req.body.password, user.password)) {
        res.status(200).json({
        });
        return;
      }
    }
    res.status(401).json({ message: "Invalid email or password" });
  } catch (err) {
    res.json({ message: "Sorry, something gone wrong" });
  }
});

export const register = asyncHandler(async (req: Request, res: Response) => {
  try {
    //if email already exists
    const existingEmail = await UserRecord.findOne({ email: req.body.email });
    if (existingEmail) throw new ValidationError("Podany adres email już istnieje.");

    //if not
    //new user
    const user = await UserRecord.save({
      user_id: uuidv4(),
      email: req.body.email,
      password: bcrypt.hashSync(req.body.password, 8),
    });

    res.status(201).json({ createdUser: user });
  } catch (err) {
    console.log(err);
    res.json(err.message);
  }
});

export const findUser = asyncHandler(async (req: Request, res: Response) => {
  try {
    const user = await UserRecord.findById({ id: req.params.id });
    if (user) {
      res.status(200).json(user);
    } else {
      res.status(404).json({ message: "User not found" });
    }
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});