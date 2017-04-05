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
        products.delete_if{|p| p['sku'] == sku or p['sku'] == 0}
        products.map do  |p|
              p[:price] =  @group_price_api.find_by_sku_group_id(p['sku'], customer_id)
              p
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