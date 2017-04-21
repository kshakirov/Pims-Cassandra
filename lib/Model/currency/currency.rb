module TurboCassandra
  module Model
    class Currency < BaseModel
    end
    Currency.primary_index  = ['code']
  end
end