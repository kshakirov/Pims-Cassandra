module TurboCassandra
  module API
    class Product

      def initialize
        @generator = Cassandra::Uuid::Generator.new
      end

      def find_by_sku sku
        product =TurboCassandra::Model::Product.find sku
        begin
          product.to_hash
        rescue
          nil
        end
      end

      def find sku
        TurboCassandra::Model::Product.find sku
      end

      def where_skus skus
        TurboCassandra::Model::Product.find_in_by sku: skus
      end

      def each &block
        @product_model.each &block
      end

      def paginate paging_state, page_size
        paging_params = {
            'paging_state' => paging_state,
            'page_size' => page_size
        }
        TurboCassandra::Model::Product.paginate paging_params
      end

      def create product_hash
        product_hash['created_at'] =@generator.now
        product = TurboCassandra::Model::Product.new product_hash
        product.save

      end

      def update product_hash
        product = TurboCassandra::Model::Product.new product_hash
        product.save
      end

      def delete sku
          TurboCassandra::Model::Product.delete sku
      end

    end
  end
end