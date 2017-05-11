module TurboCassandra
  module Model
    class Notification < BaseModel
    end
    Notification.primary_index = ['code']
  end
end