module TurboCassandra
  module Controller
    class MessageLog
      include MessageLogPagination
      private
      def prepare_queue rabbit_conn, queue
        channel = rabbit_conn.create_channel
        channel.queue(queue)
      end

      def prepare_incoming_message sender_email, admin_email, message
        {
            sender_email: sender_email,
            recepient_email: admin_email,
            message: message
        }
      end

      def prepare_outcoming_message recepient_emai, admin_email, message
        {
            sender_email: admin_email,
            recepient_email: recepient_emai,
            message: message
        }
      end

      def prepare_queue_payload email, action
        {
            "email": email,
            "action": action
        }.to_json
      end

      def prepare_order_queue_payload request
        {
            "email": request['email'],
            "order_id": request['order_id'],
            "action": 'order'
        }.to_json
      end

      def log_task sender_email, admin_email, body
        message_data = prepare_incoming_message(sender_email, admin_email, body)
        @message_log_api.add_message(message_data)
      end

      def publish_task payload
        @channel.publish(payload, :routing_key => @queue)
      end

      def commit_log recepient_email, admin_email, body
        message_date = prepare_outcoming_message(recepient_email, admin_email, body)
        @message_log_api.add_message(message_date)
        {
            result: true
        }
      end

      public
      def initialize (rabbit_conn, queue='customer_email')
        @message_log_api = TurboCassandra::API::MessageLog.new
        @queue = queue
        @channel = prepare_queue(rabbit_conn, queue)
      end

      def queue_password_reset_task read, admin_email
        request = JSON.parse read
        queue_payload = prepare_queue_payload(request["email"], 'reset')
        log_task(request["email"], admin_email, "Customer [#{request['email']}] Queued To Reset Password")
        publish_task(queue_payload)
      end


      def queue_order_task body, admin_email
        request = JSON.parse body
        task_payload = prepare_order_queue_payload(request)
        log_task(request["email"], admin_email, "Order [#{request['order_id']}] Queued To Email")
        publish_task(task_payload)
      end


      def log_task_complete body, admin_email
        request_payload = JSON.parse body
        commit_log(request_payload["email"], admin_email, request_payload['message'])
      end

      def queue_new_customer_task read, admin_email
        request = JSON.parse read
        queue_payload = prepare_queue_payload(request["email"], 'new')
        log_task(request_payload["email"], admin_email, 'New Customer')
        publish_task( queue_payload)
      end

      def log_new_customer_task read, admin_email
        request_payload = JSON.parse read
        message = "New  Customer [#{request_payload['email']}],  new password   [ #{request_payload['password']}]"
        commit_log(request_payload["email"], admin_email, message)
      end

    end
  end

end