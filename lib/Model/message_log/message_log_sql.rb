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

      def select_paginated_cql
        "SELECT * FROM message_logs"
      end

    end
    end
  end
