import * as path from 'path';
import { diskStorage } from 'multer';
import * as mime from 'mime-types';
import { v4 as uuid } from 'uuid';

export function storageDir() {
    return path.join(__dirname, '../../src/assets/images');
}

export function multerStorage(dest: string) {
    return diskStorage({
        destination: (req, file, cb) => cb(null, dest),
        filename: (req, file, cb) => cb(null, `${uuid()}${path.extname(file.originalname)}`),
    });
}
