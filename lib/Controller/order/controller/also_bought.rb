module TurboCassandra
  module Controller
    module AlsoBought
      private

      def derive_name sku, name
        if name.nil? or name.size ==0
         return  "Product Number [#{sku}]"
        end
        name
      end

      def _get_also_bought_products sku, customer_id
        products = @order_api.get_also_bought_products(sku)
        products.delete_if{|p| p['sku'] == sku}
        products.map do  |p|
          product = @product_api.find_by_sku sku
          {
              sku: p['sku'],
              name: derive_name(p['sku'], p['name']),
              part_type: product['part_type'],
              description: product['description'],
              price: @group_price_api.find_by_sku_group_id(sku, customer_id)
          }
        end
      end

      public
      def get_also_bought_products sku, customer_data
        customer_group = customer_data.first['group']
        _get_also_bought_products(sku.to_i, customer_group)
      end

    end
  end
end