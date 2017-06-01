module TurboCassandra
  module Model
    class Cart
      include TurboCassandra::Model::Utils
      include CartSql
      private


      def create customer_id
        execute_query(create_insert_cql, [customer_id, "USD", customer_id])
      end

      def is_product_in_cart? cart, product
        if cart['items'].nil?
          false
        else
          cart['items'].key? product['sku']
        end

      end

      def change_qty cart, product, qty
        item = cart['items'][product['sku']]
        item['qty'] = (item['qty'].to_i +  qty).to_s
        item['subtotal'] = (item['qty'].to_i * item['unit_price'].to_f).to_s

      end


      def prepare_product_item product, price, qty
        item_hash = {}
        item_content = {}
        if not product['ti_part_sku'].nil?
          item_hash[product['ti_part_sku']] = item_content
          item_content['ti_part'] = product['ti_part_number']
          item_content['oem_part'] = product['part_number']
          item_content['oem_part_sku'] = product['sku'].to_s

        else
          item_hash[product['sku']] = item_content
          item_content['ti_part'] = product['part_number']
        end
        item_content['part_type'] =product['part_type']
        item_content['unit_price'] =price.to_s
        item_content['qty'] =qty.to_s
        item_content['subtotal'] =(price * qty).to_s
        item_hash
      end

      def merge_cart_products cart, product_hash
        items = cart['items']
        if cart['items'].nil?
          items = {}
        end
        sku = product_hash.keys.first
        items[sku] = product_hash[sku]
        items
      end

      def _add_product cart, product, price, qty
        cql = create_update_product_item_sql
        if is_product_in_cart? cart, product
          change_qty cart, product, qty
          execute_query(cql, [cart['items'], cart['id']])
        else
          args = merge_cart_products(cart, prepare_product_item(product, price, qty))
          execute_query(cql, [args, cart['id']])
        end
      end

      def get_grand_total cart
        cart['items'].inject(0) { |sum, p|
          sum + p[1]['subtotal'].to_f
        }
      end

      def update_grand_total result, cart
        if result
          updated_cart = find_by_customer_id(cart['id'])
          grand_total = get_grand_total(updated_cart)
          execute_query(create_update_total_sql, [grand_total.to_f, updated_cart['id']])
        end
      end

      def _delete_item cart, product_sku
        cart['items'].delete(product_sku)
        cql = create_update_product_item_sql
        execute_query(cql, [cart['items'], cart['id']])
      end

      def _count_items items
        items.values.map { |i| i['qty'] }.inject { |sum, q| sum.to_i + q.to_i }
      end

      public

      def find_by_customer_id customer_id
        cart = execute_query(create_select_where_id_cql, [customer_id])
        cart.first
      end

      def add_product customer_id, product, price, qty
        cart = find_by_customer_id(customer_id)
        if cart.nil?
          create customer_id
          cart = find_by_customer_id(customer_id)
        end
        update_grand_total(_add_product(cart, product, price, qty), cart)

      end

      def update cart
        cql = create_update_product_item_sql
        execute_query(cql, [cart['items'], cart['id']])
        execute_query(create_update_total_sql, [cart['subtotal'].to_f, cart['id']])
      end

      def delete_product customer_id, product_sku
        cart = find_by_customer_id(customer_id)
        update_grand_total(_delete_item(cart, product_sku), cart)
      end

      def purge customer_id
        cart = find_by_customer_id(customer_id)
        execute_query(create_update_product_item_sql, [{}, cart['id']])
        true
      end

      def count_items customer_id
        items = execute_query(select_items_where_id_cql, [customer_id])
        unless items.nil? or items.first.nil?
          _count_items(items.first['items'])
        end
      end

      def update_currency customer_id, currency
        execute_query(create_update_currency_sql, [currency, customer_id])
        true
      end
    end
  end
end