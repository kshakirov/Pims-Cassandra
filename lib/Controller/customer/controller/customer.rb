module TurboCassandra
  module Controller
    class Customer
      private
      def get_customer_id customer_data
        if customer_data.class.name =='Array'
          customer_data.first['id']
        elsif customer_data.class.name == 'Hash'
          customer_data['id'].to_i
        end
      end

      def is_email_unique? data
        customers = TurboCassandra::Model::Customer.find_by email: data['email']
        if customers.empty? or customers.first['id'] == data['id']
          true
        else
          raise 'Email Is Already Used'
        end
      end

      public
      def initialize
        @customer = TurboCassandra::API::Customer.new
        @cart = TurboCassandra::API::Cart.new
        @login_manager = Login.new
      end

      def get_account customer_data
        id = get_customer_id(customer_data)
        customer = @customer.find_by_customer_id id
        customer.to_hash
      end

      def update_account data
        if is_email_unique? data
            @customer.update(data)
        end
      end

      def update_password data
        validated = @login_manager.validate_customer(data['password'], data['email'])
        if validated
          data['password'] = @login_manager.hash_password(data['password_new'])
          data.delete 'password_new'
          update_account(data)
        end
        validated
      end

      def get_customer_data customer
        {
            name: get_name(customer),
            cart: get_cart_items_number(customer),
            wishlist: 3
        }
      end

      def get_all
        @customer.all
      end

      def get_by_email email
        @customer.find_by_email(email)
      end

      private

      def get_name customer
        customer['name']
      end

      def get_cart_items_number customer
        cart = @cart.find(customer['id'])
        unless cart.nil?
          cart['items'].keys.size
        end
      end

      def create customer_data
        @customer.insert(customer_data)
      end
    end
  end
end