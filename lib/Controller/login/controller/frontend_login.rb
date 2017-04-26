module TurboCassandra
  module Controller
    class Login
      include JwtSettings
      include PasswordHash
      public
      def initialize
        @customer = TurboCassandra::API::Customer.new
        @jwt_issuer = get_jwt_user
        @jwt_secret =  get_jwt_secret
      end

      private
      def get_customer customer_email
        @customer.find_by_email customer_email
      end

      def token customer
        JWT.encode payload(customer), @jwt_secret
      end

      def payload customer
        {
            exp: Time.now.to_i + 60 * 60 * 6000,
            iat: Time.now.to_i,
            iss: @jwt_issuer,
            scopes: ['view_prices'],
            customer: {
                id: customer['id'],
                group: customer['group_id'],
                name: "#{customer['firstname']} #{customer['lastname']}"
            }
        }
      end

      public
      def validate_password password, customer_email
        customer = get_customer customer_email
        if validate_hashes(password, customer['password'])
          {
              result: 'success',
              token: token(customer)
          }
        else
          {
              result: 'failed'
          }
        end
      end

      def validate_customer password, customer_email
        customer = get_customer customer_email
        validate_hashes(password, customer['password'])
      end

      def hash_password password
        _hash_password(password).to_s
      end


    end
  end
end