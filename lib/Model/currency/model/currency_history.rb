module TurboCassandra
  module Model
    class CurrencyHistory
      include TurboCassandra::Model::Utils
      include CurrencyHistorySql

      public
      def insert hash
        names, values, args = prepare_attributes(hash)
        execute_query(create_insert_cql(names, values), args)
      end
    end
  end
end