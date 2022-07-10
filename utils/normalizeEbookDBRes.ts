import { Ebook, EbookEntity } from "../types";

export const normalizeEbookDBRes = (data: EbookEntity[] = []) => {

  const ebooks: Ebook[] = [];

  data.forEach(record => {
    const tempEbook = ebooks.find(item => item.ebook_id === record.ebook_id);

    if (tempEbook) {
      tempEbook.author.push({
        id: record.author_id,
        name: record.author_name,
      });
      tempEbook.category.push(record.category_name);
    } else {
      const ebook: Ebook = {
        ebook_id: record.ebook_id,
        title: record.title,
        num_pages: record.num_pages,
        publication_date: new Date(record.publication_date).toLocaleDateString(),
        description: record.description,
        price: record.price,
        publisher_name: record.publisher_name,
        language_code: record.language_code,
        language_name: record.language_name,
        author: [{
          id: record.author_id,
          name: record.author_name,
        }],
        category: [`${record.category_name}`],
      };

      ebooks.push(ebook);
    }
  });

  return ebooks;

}