module TurboCassandra
  module Controller
    module AdminCustomerPassword
      def create_password customer
        new_password = SecureRandom.urlsafe_base64(10)
        customer['password']= @login_manager.hash_password(new_password)
        new_password
      end

      def create_password_from password
        @login_manager.hash_password(password)
      end

      def respond_with_password customer
        new_password = create_password(customer)
        @customer_api.update(customer)
        {
            "result": true,
            "password": new_password
        }
      end

      def _reset_password email
        customer = search_customer(email)
        if customer_available?(customer)
          respond_with_password(customer)
        else
          respond_with_not_found
        end
      end

      def _change_password email, password
        customer = search_customer(email)
        customer['password'] = create_password_from(password)
        @customer_api.update(customer)
        true
      end

    end
  end
end