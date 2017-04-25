module TurboCassandra
  module Model
    class User < BaseModel
    end
    User.primary_index  = ['login']
  end
end