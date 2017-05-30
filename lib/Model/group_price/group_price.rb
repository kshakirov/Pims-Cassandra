module TurboCassandra
  module Model
    class GroupPrice < BaseModel
    end
    GroupPrice.primary_index = ['sku']
  end
end