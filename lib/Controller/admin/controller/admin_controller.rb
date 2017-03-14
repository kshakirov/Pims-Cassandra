module TurboCassandra
  module Controller
    class Admin
      attr_accessor :customer_api, :order_controller, :order_api, :cart_api
      include TurboCassandra::Controller::Utils
      include AdminCustomerAddress
      include AdminCustomerPassword
      include AdminCustomerRespose
      include AdminCustomerOrder
      private

      def get_customer_by_email email
        @customer_api.find_by_email email
      end

      def search_customer email
        get_customer_by_email(email)
      end

      def customer_available? customer
        not (customer.nil? or not customer)
      end

      def add_customer_info email
        {
            "email" => email,
            "group_id" => '2',
            "default_shipping_address" => add_default_shipping_address,
            "default_billing_address" => add_default_billing_address
        }
      end

      def create_base customer_data
        password = create_password(customer_data)
        customer_data['cid'] = @customer_api.new(customer_data)
        respond_with_customer(customer_data, password)
      end

      def _create_new_customer email
        customer_data = add_customer_info(email)
        create_base(customer_data)
      end


      public
      def initialize
        @customer_api = TurboCassandra::API::Customer.new
        @order_controller = TurboCassandra::Controller::Order.new
        @order_api = TurboCassandra::API::Order.new
        @cart_api = TurboCassandra::API::Cart.new
        @featured_api = TurboCassandra::API::Cart.new
        @login_manager = Login.new
      end

      def reset_password body
        params = JSON.parse body
        _reset_password params['email']
      end

      def create_new_customer body
        params = JSON.parse body
        _create_new_customer params['email']
      end

      def create_new_customer_by_admin body
        customer_data = JSON.parse body
        customer_data["default_shipping_address"] = add_default_shipping_address
        customer_data["default_billing_address"] = add_default_billing_address
        create_base(customer_data)
      end

      def delete id
        @customer_api.delete(id)
      end
    end
  end
end