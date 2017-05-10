module TurboCassandra
  module Controller
    class AdminEmail
      def initialize
        @admin_email_api = TurboCassandra::API::AdminEmail.new
      end
      def all
        @admin_email_api.get_list
      end
    end
  end
end