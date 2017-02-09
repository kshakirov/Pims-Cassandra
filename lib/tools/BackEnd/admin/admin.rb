module TurboCassandra
  class  AdminBackEnd
    private

    def get_customer_by_email email
      @customer.get_by_email(email)
    end

    def change_password
        new_password = SecureRandom.urlsafe_base64(10)
        @login_manager.hash_password(new_password)
    end

    public
    def initialize
      @customer = CustomerBackEnd.new
      @cart = Cart.new
      @login_manager = Login.new
    end

    def change_password_by_email email
        customer = get_customer_by_email(email)
        customer['password'] = change_password
        @customer.update(customer)
    end
  end
end