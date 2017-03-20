module TurboCassandra
  module Model
    module CurrencyHistorySql
      def create_insert_cql names, values
        "INSERT INTO currency_histories  (#{names}) " \
            "VALUES (#{values})"
      end
    end
  end
end