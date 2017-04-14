module TurboCassandra
  module Model
    module MessageLogSql
      def insert_cql names, values
        "INSERT INTO message_logs  (#{names}) " \
            "VALUES (#{values})"
      end

      def select_by_email_cql
        "SELECT * from  message_logs WHERE customer_email=? "
      end

      def select_by_email_and_id
        "SELECT * from  message_logs WHERE customer_email=?   and id=?"
      end

      def update_cql sets
          "UPDATE message_logs SET #{sets}  WHERE customer_email = ?  AND id = ?"
      end

      def select_paginated_cql params
        if params.key? 'sender' and params['sender'].size > 1
          "SELECT * FROM message_logs WHERE customer_email='#{params['sender']}'"
        else
          "SELECT * FROM message_logs"
        end
      end
    end
  end
end
