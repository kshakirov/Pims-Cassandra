module TurboCassandra
  module Model
    module NewProductSql
      def select_all_cql
        "SELECT * from  new_products"
      end

      def create_insert_cql names, values
        "INSERT INTO new_products  (#{names}) " \
            "VALUES (#{values})"
      end

      def create_delete_cql
        "DELETE FROM  new_products WHERE SKU=?"
      end

      def creat_update_cql
        "UPDATE new_products SET ord = ?, visible = ?  WHERE sku=?"
      end
    end
  end
end
