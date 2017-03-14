module TurboCassandra
  module API
    class NewProduct
      def initialize
        @product_backend = TurboCassandra::Controller::Product.new
        @new_product_model = TurboCassandra::Model::NewProduct.new
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
        products = @product_backend.get_products(new_product_ids.map { |f| f['sku'] })
        _create_response(products)
      end
    end
  end
end