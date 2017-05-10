module TurboCassandra
  module API
    class AdminEmail
      def initialize
      end
      def get_list
        TurboCassandra::Model::AdminEmail.all
      end
    end
  end
end