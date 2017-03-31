module TurboCassandra
  module API
    module OeRefProduct

      def get_interchanged_products interchanges
        interchanges.map do |i|
          @product_api.find_by_sku(i)
        end
      end

      def get_oe_refs interchanges
        unless interchanges.nil?
          products = get_interchanged_products interchanges
          unless products.nil?
            products.map { |i| i['part_number'] }
          end
        end
      end
    end
  end
end