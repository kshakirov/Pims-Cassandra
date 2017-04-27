module TurboCassandra
  module Model

    class Customer < BaseModel
    end
    Customer.primary_index  = ['id']
  end
end