module TurboCassandra
  module API
    class FeaturedProduct
      include OeRefProduct

      def initialize
        @product_api = TurboCassandra::API::Product.new
        @featured_product_model = TurboCassandra::Model::FeaturedProduct.new
      end

      private
      def _get_scheleton product
        {
            description: product['description'],
            name: product['part_number'],
            part_type: product['part_type'],
            url: "/#/part/sku/#{product['sku']}",
            image_url: "/imageserver/product/#{product['sku']}/image/215/165",
            price: nil,
            turbo_model: product['turbo_model'],
            turbo_type: product['turbo_type'],
            sku: product['sku'],
            oe_ref_urls: get_oe_refs(product['interchanges'])
        }
      end

      def _create_response products
        products.map { |p|
          _get_scheleton(p)
        }
      end

      def sort products, featured_ids
        featured_ids.map do |fi|
          index = products.find_index { |p| p['sku'] == fi['sku'] }
          products[index]
        end
      end

      public
      def get_featured_products
        featured_product_ids = @featured_product_model.all
        featured_product_ids.sort_by! { |id| id['ord'] }
        products = @product_api.where_skus(featured_product_ids.map { |f| f['sku'] })
        products = sort(products, featured_product_ids)
        _create_response(products)
      end

      def all
        @featured_product_model.all
      end

      def update product
        @featured_product_model.update(product)
      end

      def create product_data
        @featured_product_model.insert(product_data)
      end

      def delete sku
        @featured_product_model.delete(sku)
      end

    end
  end
end