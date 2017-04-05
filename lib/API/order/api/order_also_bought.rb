module TurboCassandra
  module API
    module AlsoBought
      private
      def map_product_orders order_data
        order_data['products'].map { |p| p['sku'] }
      end

      def _product_skeleton product
        {
            sku: product['sku'],
            name: product['part_number'],
            description: product['description'],
            part_type: product['part_type'],
            interchanges:  resolve(product['interchanges'])

        }
      end

      def _product_order_skeleton product
        {
            sku: product['sku'],
            name: product['part_number'],

        }
      end

      def map_order_products order_data
        order_data['products'].map { |p|
          product = @product_api.find_by_sku p ['sku'].to_i
          if not product.nil?
              _product_skeleton(product)
          else
            _product_order_skeleton(p)
          end
        }
      end

      def make_product_data_2_register order_data, p
        {
            order_id: order_data['order_id'].to_i,
            sku: p.to_i
        }
      end

      def make_order_data_2_register order_data, p
        {
            order_id: order_data['order_id'].to_i,
            sku: p[:sku].to_i,
            name: p[:name] || '',
            part_type: p[:part_type],
            description: p[:description],
            interchanges: p[:interchanges]
        }
      end

      def map_orders_from_products products
        products.map { |p| p['order_id'] }
      end

      public
      def register_order_product order_data
        products = map_order_products(order_data)
        products.each do |p|
          @order_model.insert_order_product(make_order_data_2_register(order_data, p))
        end
      end

      def register_product_order order_data
        products = map_product_orders(order_data)
        products.each do |p|
          @order_model.insert_product_order(make_product_data_2_register(order_data, p))
        end
      end

      def register_also_bought_products order_data
        register_product_order(order_data)
        register_order_product(order_data)
      end

      def _get_also_bought_products sku
        orders = @order_model.find_orders_by_product sku
        order_ids = map_orders_from_products(orders)
        @order_model.find_products_by_order(order_ids)
      end

    end
  end
end