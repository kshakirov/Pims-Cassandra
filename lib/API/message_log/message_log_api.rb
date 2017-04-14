module TurboCassandra
  module API
    class MessageLog
      private
      def _add_message message_data
        message = {
            customer_email: message_data[:customer_email],
            id: @generator.now,
            status: message_data[:status],
            date_start:  Time.now.to_time,
            message: message_data[:message]
        }
        @message_log_model.insert(message)
      end

      def _get_message_by_sender_email email
        @message_log_model.find_by_sender_email(email)
      end

      public
      def initialize
        @message_log_model = TurboCassandra::Model::MessageLog.new
        @generator = Cassandra::Uuid::Generator.new
      end

      def add_message message_data
        _add_message(message_data)
      end

      def get_message_by_sender_email  email
          _get_message_by_sender_email(email)
      end

      def paginate params
        @message_log_model.paginate params
      end

      def update_message_by_id email, id, message_data
        @message_log_model.update email, id, message_data
      end
    end
  end

end