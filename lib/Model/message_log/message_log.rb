module TurboCassandra
  module Model
    class MessageLog
      include TurboCassandra::Model::Utils
      include MessageLogSql

      private
      def return_id hash
        if hash.key? 'id'
          hash['id']
        elsif hash.key? :id
          hash[:id]
        end
      end

      public
      def insert hash
        names, values, args = prepare_attributes(hash)
        execute_query(insert_cql(names, values), args)
        return_id(hash)
      end

      def update email, id, data
        sets, args = prepare_sets(data)
        args.push(email, id)
        execute_query(update_cql(sets), args)
      end

      def find_by_sender_email email
        result = execute_query(select_by_email_cql, [email])
        result.map{|r| r}
      end

      def find_by_email_and_id email, id
        result = execute_query(select_by_email_and_id, [email,id])
        result.map{|r| r}
      end

      def execute_paginate sql, paging_state, page_size
        session = TurboCluster.get_session
        session.execute(sql, page_size: page_size, paging_state: paging_state)
      end

      def paginate params
        paging_state = params['paging_state']
        page_size = params['page_size']
        rs = execute_paginate(select_paginated_cql(params), paging_state, page_size)
        {
            results: rs.map{|r| r},
            last: rs.last_page?,
            paging_state: rs.paging_state
        }
      end
    end
  end
end
