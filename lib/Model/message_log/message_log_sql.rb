module TurboCassandra
  module Model
    module MessageLogSql
      def insert_cql names, values
        "INSERT INTO message_logs  (#{names}) " \
            "VALUES (#{values})"
      end

      def select_by_sender_email_cql
        "SELECT * from  message_logs WHERE sender_email=? "
      end

      def select_paginated_cql params
        if (params.key? 'sender' and params.key? 'recipient') and (params['sender'].size> 1 and params['recipient'].size > 1)
          "SELECT * FROM message_logs WHERE sender_email='#{params['sender']}' AND recepient_email='#{params['recipient']}'"
        elsif params.key? 'sender' and params['sender'].size > 1
          "SELECT * FROM message_logs WHERE sender_email='#{params['sender']}'"
        else
          "SELECT * FROM message_logs"
        end
      end
    end
  end
end
