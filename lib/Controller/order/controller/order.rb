module TurboCassandra
  module Controller
    class Order
      attr_accessor :order_api
      include OrderPrint
      include AlsoBought
      include OrderAdminCreate

      public
      def initialize
        @order_api = TurboCassandra::API::Order.new
        @customer_api = TurboCassandra::API::Customer.new
        @cart_api = TurboCassandra::API::Cart.new
      end

      private

      def _get_order_by_customer_id id
        order = @order_api.find_by_customer_id(id)
        order.map { |o| o }
      end


      def _get_order_by_id id
        order = @order_api.find_by_id(id)
        order.first
      end

      def get_customer_data customer_id
        customer_data = @customer_api.find_by_customer_id customer_id
        {
            order_id: 1,
            customer_id: customer_id,
            data: {
                billing_address: customer_data['default_billing_address'],
                shipping_address: customer_data['default_shipping_address'],
                email: customer_data['email']

            }
        }
      end

      def get_products cart
        cart['items'].map { |key, value|
          {
              sku: key,
              name: value['ti_part'],
              part_type: value['part_type'],
              oem_part: value['oem_part'] || '',
              quantity: value['qty'].to_s,
              row_total: value['subtotal'].to_s,
              subtotal: value['subtotal'].to_s,
              original_price: value['unit_price'].to_s,
              price: value['unit_price'].to_s,
              item_status: 'Ordered'
          }
        }
      end


      def get_cart_data customer_id
        @cart_api.find(customer_id)
      end

      def add_cart_info cart
        {
            base_subtotal: cart['subtotal'],
            base_currency_code: cart['currency']
        }
      end

      def _create_order customer_id
        data = get_customer_data(customer_id)
        cart = get_cart_data(customer_id)
        data['products'] = get_products(cart)
        data[:data].merge!(add_cart_info(cart))
        data
      end

      public

      def get_order_by_customer_id id
        _get_order_by_customer_id(id)
      end

      def create_order customer_id
        _create_order(customer_id)
      end

      def save customer_id, order_data
        next_id = @order_api.get_next_order_id
        order_data['order_id'] = next_id + 1
        order_data['customer_id'] = customer_id
        @order_api.insert order_data
        @cart_api.empty_cart(customer_id)
        @order_api.register_also_bought_products(order_data)
        order_data
      end

      def get_order order_id
        _get_order_by_id (order_id)

      end

      def find order_id
        _get_order_by_id (order_id)
      end

      def find_all_by_customer customer_id
        get_order_by_customer_id(customer_id)
      end

      def all
        @order_api.all
      end

      def all_shipments
        @order_api.all_shipments
      end

      def find_shipment_by_order_id params
        order_id = params['order_id'].to_i
        id = params['id'].to_i
        @order_api.find_shipment_by_order_id(order_id, id)
      end

      def find_shipment_only_by_order_id params
        order_id = params['order_id'].to_i
        @order_api.find_shipment_only_by_order_id(order_id)
      end

      def print order_id
        order = _get_order_by_id (order_id)
        print_order(order)
      end

      def  create_order_by_admin body
          order_data = JSON.parse body
        _create_order_by_admin order_data
      end

    end
  end
end