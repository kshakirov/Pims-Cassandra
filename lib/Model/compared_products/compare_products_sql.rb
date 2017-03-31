module TurboCassandra
  module Model
    module  ComparedProductSql

      def create_insert_cql names, values
        "INSERT INTO compared_products  (#{names}) " \
            "VALUES (#{values})"
      end

      def select_by_customer_id_cql
        "SELECT * from  compared_products where customer_id = ?"
      end

      def delete_by_id_sql
        "Delete   from  compared_products where customer_id = ? and product = ?"
      end

      def delete_by_customer_sql
        "Delete   from  compared_products where customer_id = ?"
      end

      def count_by_customer_id_cql
        "Select count(*) FROM compared_products WHERE customer_id=?"
      end

    end
  end
end