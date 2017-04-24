module TurboCassandra
  module Model
    class CustomerGroup < BaseModel
    end
    CustomerGroup.primary_index =  ['code']
  end
end