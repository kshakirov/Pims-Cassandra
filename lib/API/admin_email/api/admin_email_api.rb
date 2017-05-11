module TurboCassandra
  module API
    class AdminEmail
      def initialize
      end
      def get_list
        TurboCassandra::Model::AdminEmail.all
      end
      def get code
        TurboCassandra::Model::AdminEmail.find code
      end

      def add admin_email_hash
          admin_email = TurboCassandra::Model::AdminEmail.new admin_email_hash
          admin_email.save
      end
    end
  end
end