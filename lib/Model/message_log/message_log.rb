module TurboCassandra
  module Model
    class MessageLog
      include TurboCassandra::Model::Utils
      include MessageLogSql

      public
      def insert hash
        names, values, args = prepare_attributes(hash)
        execute_query(insert_cql(names, values), args)
        true
      end

      def find_by_sender_email email
        result = execute_query(select_by_sender_email_cql, [email])
        result.map{|r| r}
      end

      def paginate
        result = execute_query(select_paginated_cql, [])
        result.map{|r| r}
      end
    end
  end
end
