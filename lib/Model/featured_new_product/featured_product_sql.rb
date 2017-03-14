module TurboCassandra
  module Model
    module FeaturedProductSql

      def select_all_cql
        "SELECT * from  featured_products"
      end

      def create_insert_cql names, values
        "INSERT INTO featured_products  (#{names}) " \
            "VALUES (#{values})"
      end

      def create_delete_cql
        "DELETE FROM  featured_products WHERE SKU=?"
      end

      def creat_update_cql
        "UPDATE featured_products SET ord = ?, visible = ?  WHERE sku=?"
      end
    end
  end
end