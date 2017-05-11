module TurboCassandra
  module API
    class Notification
      def initialize
      end
      def get_list
        TurboCassandra::Model::Notification.all
      end
      def add notification_hash
        notification = TurboCassandra::Model::Notification.new notification_hash
        notification.save
      end

      def get code
        TurboCassandra::Model::Notification.find code
      end

    end
  end
end