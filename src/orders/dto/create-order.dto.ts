export class CreateOrderDto {
  order_id: string;
  products_ids: string[];
  payment_method: string;
  discount_code: string;
  customer_first_name: string;
  customer_last_name: string;
  customer_address: string;
  zip_code: string;
  tel_number: string;
}
