module TurboCassandra
  module Model
    class Currency
      include TurboCassandra::Model::Utils
      include CurrencySql

      public
      def insert hash
        names, values, args = prepare_attributes(hash)
        execute_query(create_insert_cql(names, values), args)
      end

      def all
        res = execute_query(select_all_cql, [])
        unless res.nil?
          res.map{|r| r}
        end
      end
    end
  end
end