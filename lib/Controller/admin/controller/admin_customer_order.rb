module TurboCassandra
  module Controller
    module AdminCustomerOrder
      def cart_empty? customer_id
        count = @cart_api.count_products(customer_id)
        count.to_i == 0
      end

      def add_cart_info cart
        {
            'base_subtotal ' => cart['subtotal'].to_s,
            'base_currency_code' => cart['currency'].to_s
        }
      end

      def get_customer_data customer_id
        customer_data = @customer_api.find_by_customer_id customer_id
        {
            order_id: 1,
            customer_id: customer_id,
            billing_address:  customer_data['default_billing_address'],
            shipping_address:  customer_data['default_shipping_address'],
            data: {
                'email' => customer_data['email']
            }

        }
      end

      def get_products cart
        cart['items'].map { |key, value|
          {
              'sku'=> key.to_s,
              'name'=> value['ti_part'],
              'part_type' => value['part_type'],
              'oem_part' => value['oem_part'] || '',
              'qty_ordered' => value['qty'].to_s,
              'qty_shipped' => 0.to_s,
              'base_row_total' => value['subtotal'].to_s,
              'base_price_incl_tax' => value['unit_price'].to_s,
          }
        }
      end

      def get_cart_data customer_id
        @cart_api.find(customer_id)
      end

      def _create_order customer_id
        data = get_customer_data(customer_id)
        cart = get_cart_data(customer_id)
        data['products'] = get_products(cart)
        data[:data].merge!(add_cart_info(cart))
        data
      end

      def add_order_id order_data
        next_id = @order_api.get_next_order_id
        order_data[:order_id] = next_id + 1
      end

      def save customer_id, order_data
        add_order_id(order_data)
        order_data = compact_objects(order_data)
        @order_api.insert order_data
        @cart_api.empty_cart(customer_id)
        @order_api.register_also_bought_products(order_data)
        order_data
      end


      def create_order params
        customer_id = params['id'].to_i
        unless cart_empty? customer_id
          order_data = _create_order customer_id
          save customer_id, order_data
        end
      end
    end
  end
end