import { diskStorage } from 'multer';
import * as path from 'path';
import { v4 as uuid } from 'uuid';

// export function storageDir() {
//     return path.join(__dirname, '../../src/assets/images');
// }

export function storageDir(fileFieldName: string) {
    switch (fileFieldName) {
        case 'cover':
            return path.join(__dirname, '../../src/assets/images/book-covers');
        case 'ebook':
            return path.join(__dirname, '../../src/assets/files/ebooks');
        default:
            throw new Error('Invalid file field name');
    }
}

export function multerStorage() {
    return diskStorage({
        destination: (req, file, cb) => cb(null, storageDir(file.fieldname)),
        filename: (req, file, cb) => cb(null, `${uuid()}${path.extname(file.originalname)}`),
    });
}

// export function multerStorage(dest: string) {
//     return diskStorage({
//         destination: (req, file, cb) => cb(null, dest),
//         filename: (req, file, cb) => cb(null, `${uuid()}${path.extname(file.originalname)}`),
//     });
// }
