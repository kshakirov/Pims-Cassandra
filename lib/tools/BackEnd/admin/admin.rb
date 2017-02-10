module TurboCassandra
  class AdminBackEnd
    private

    def get_customer_by_email email
      @customer.get_by_email(email)
    end

    def change_password customer
      new_password = SecureRandom.urlsafe_base64(10)
      customer['password']= @login_manager.hash_password(new_password)
      new_password
    end

    def respond_with_password customer
      new_password = change_password(customer)
      @customer.update(customer)
      {
          "result": true,
          "password": new_password
      }
    end

    def respond_with_not_found
      {
          "result": false
      }
    end

    def search_customer email
      get_customer_by_email(email)
    end

    def customer_available? customer
      not (customer.nil? or not customer)
    end

    def _reset_password email
      customer = search_customer(email)
      if customer_available?(customer)
        respond_with_password(customer)
      else
        respond_with_not_found
      end
    end

    public
    def initialize
      @customer = CustomerBackEnd.new
      @cart = Cart.new
      @login_manager = Login.new
    end

    def reset_password email
      _reset_password email
    end
  end
end