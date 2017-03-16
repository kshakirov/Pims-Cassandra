module TurboCassandra
  module Controller
    module OrderAdminCreate

      def stringify hash
        Hash[hash.map { |k, v| [k.to_s, v.to_s] }]
      end
      def validate_order order_data
        order_data['products'] = order_data['products'].map{|p| stringify(p)}
        order_data['billing_address'] = stringify(order_data['billing_address'])
        order_data['shipping_address'] = stringify(order_data['shipping_address'])
        order_data['shipping_handling'] = order_data['shipping_handling'].to_f
        order_data['subtotal'] = order_data['subtotal'].to_f
        order_data['grand_total'] = order_data['grand_total'].to_f
        order_data['updated_at'] = Time.now.to_time
        order_data
      end
      def _create_order_by_admin order_data
        last_id = @order_api.get_next_order_id
        order_data['order_id'] = last_id + 1
        @order_api.insert(validate_order(order_data))
        {
            order_id: last_id + 1
        }
      end
    end
  end
end