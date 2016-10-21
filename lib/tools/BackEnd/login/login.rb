module TurboCassandra
  class Login
    public
    def initialize
      @customer = Customer.new
    end
    private
    def hash_password data
      md5 = Digest::MD5.new
      md5.update data
    end

    def validate_hashes password, hash
      hash_with_salt = hash.split(':');
      case hash_with_salt.size
        when 1
          hash_password(password) === hash
        when 2
          hash_password(hash_with_salt[1] + password) === hash_with_salt[0]
        else
          false
      end
    end

    def get_customer_hashed_pass customer_email
      customer = @customer.find_by_email customer_email
      customer['password']
    end

    public
    def validate_password password, customer_email
      if validate_hashes(password, get_customer_hashed_pass(customer_email))
        {
            result: 'success'
        }.to_json
      else
        {
            result: 'failed'
        }.to_json
      end
    end
  end
end