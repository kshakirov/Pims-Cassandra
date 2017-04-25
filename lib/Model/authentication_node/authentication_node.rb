module TurboCassandra
  module Model
    class AuthenticationNode < BaseModel
    end
    AuthenticationNode.primary_index  = ['name']
  end
end