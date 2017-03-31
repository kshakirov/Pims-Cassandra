module TurboCassandra
  module Model
    class ComparedProducts
      include TurboCassandra::Model::Utils
      include ComparedProductSql

      private
      def _insert hash
        names, values, args = prepare_attributes(hash)
        execute_query(create_insert_cql(names, values), args)
      end

      def _delete customer_id, product
        execute_query(delete_by_id_sql, [customer_id, product])
        true
      end

      def _find customer_id
        cmp = execute_query(select_by_customer_id_cql, [customer_id])
        if cmp and cmp.size
          cmp.map { |c| c['product'] }
        end
      end

      def _count customer_id
         res =execute_query(count_by_customer_id_cql, [customer_id])
          if not res.nil? and res.first and res.first.key? 'count'
            res.first['count']
          end
      end

      def _delete_all customer_id
        execute_query(delete_by_customer_sql, [customer_id])
      end

      public

      def find customer_id
        _find(customer_id)
      end

      def insert data
        _insert(data)
        true
      end

      def delete customer_id, product
        _delete(customer_id, product)
      end

      def count customer_id
        _count(customer_id)
      end

      def delete_all customer_id
        _delete_all(customer_id)
      end

    end
  end
end