module TurboCassandra
  module Model
    module CurrencySql
      private
      def select_all_cql
        "SELECT * from  currencies"
      end

      def create_insert_cql names, values
        "INSERT INTO currencies  (#{names}) " \
            "VALUES (#{values})"
      end
    end
  end
end