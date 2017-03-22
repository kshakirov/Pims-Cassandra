module TurboCassandra
  module API
    class NewProduct

      private
      def sort products, new_ids
        new_ids.map do |ni|
          index = products.find_index{|p| p['sku'] == ni}
          products[index]
        end
      end
      public
      def initialize
        @new_product_model = TurboCassandra::Model::NewProduct.new
        @product_api = TurboCassandra::API::Product.new
      end

      def all
        @new_product_model.all
      end

      def create product_data
        @new_product_model.insert product_data
      end

      def delete sku
        @new_product_model.delete sku
      end

      def update product
        @new_product_model.update product
      end

      def _get_scheleton product
        {
            description: product['description'],
            name: product['name'],
            part_type: product['part_type'],
            url: "/#/part/sku/#{product['sku']}",
            image_url: "/imageserver/product/#{product['sku']}/image/215/165",
            price: nil,
            turbo_model: product['turbo_model'],
            turbo_type: product['turbo_type'],
            oe_ref_urls: []
        }
      end

      def _create_response products
        products.map { |p| _get_scheleton(p) }
      end

      def get_new_products
        new_product_ids = @new_product_model.all
        new_product_ids = new_product_ids.map { |n| n['sku'] }
        products = @product_api.where_skus(new_product_ids)
        products = sort(products, new_product_ids)
        _create_response(products)
      end
    end

  end
end