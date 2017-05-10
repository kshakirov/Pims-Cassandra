module TurboCassandra
  module Model
    class AdminEmail < BaseModel
    end
    AdminEmail.primary_index = ['code']
  end
end