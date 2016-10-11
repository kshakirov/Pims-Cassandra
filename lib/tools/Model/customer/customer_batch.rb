module TurboCassandra
  class CustomerBatch

    def remove_null_values hash
      hash.select{|k,v| not v.nil? and not k=='0'}
    end

    def prepare_customer_hash customer_hash
      customer_hash = remove_null_values customer_hash
      dba, dsa = 'default_billing_address', 'default_shipping_address'
      customer_hash[dba] = remove_null_values(customer_hash[dba]) if customer_hash.key? dba
      customer_hash[dsa] = remove_null_values(customer_hash[dsa]) if customer_hash.key? dsa
      customer_hash
    end
  end
end