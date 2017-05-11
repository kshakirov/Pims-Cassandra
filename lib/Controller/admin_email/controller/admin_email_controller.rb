module TurboCassandra
  module Controller
    class AdminEmail
      def initialize
        @admin_email_api = TurboCassandra::API::AdminEmail.new
      end
      def all
        @admin_email_api.get_list
      end
      def update body
        admin_email_hash = JSON.parse body
        @admin_email_api.add admin_email_hash
      end
    end
  end
end