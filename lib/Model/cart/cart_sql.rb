module TurboCassandra
  module Model
    module CartSql
      def create_insert_cql
        "INSERT  INTO  carts  (id,currency,customer_id) VALUES (?,?,?)"
      end

      def create_select_where_id_cql
        "SELECT  * FROM carts  WHERE id=?"
      end

      def select_items_where_id_cql
        "SELECT  items FROM carts  WHERE id=?"
      end

      def create_update_product_item_sql
        "UPDATE carts SET items = ? WHERE id=?"
      end

      def create_update_total_sql
        "UPDATE carts SET subtotal = ? WHERE id=?"
      end

      def create_update_currency_sql
        "UPDATE carts SET currency = ? WHERE id=?"
      end
    end
  end
end