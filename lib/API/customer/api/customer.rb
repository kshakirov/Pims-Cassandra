module TurboCassandra
  module API
    class Customer

      def find_by_customer_id id
        TurboCassandra::Model::Customer.find id
      end

      def update customer_data
        customer = TurboCassandra::Model::Customer.new customer_data
        customer.save
      end

      def update_attributes customer_id, customer_data
        customer = TurboCassandra::Model::Customer.find customer_id
        customer.update_attributes customer_data
      end


      def all
        TurboCassandra::Model::Customer.all
      end

      def find_by_email email
        customers = TurboCassandra::Model::Customer.find_by email: email
        customers.first
      end

      def new hash
        hash['id'] = TurboCassandra::Model::Customer.max + 1
        customer = TurboCassandra::Model::Customer.new hash
        customer.save
      end

      def delete id
        TurboCassandra::Model::Customer.delete id
      end

    end
  end
end