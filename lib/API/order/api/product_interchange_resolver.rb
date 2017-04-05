module TurboCassandra
  module API
    module ProductInterchangeResolver
      private
      def intechange_skeleton product
        unless product.nil?
          {
              product['sku'] => product['part_number']
          }
        end
      end

      def resolve interchanges
        unless interchanges.nil?
          ints = interchanges.map do |interchange|
            product = @product_api.find_by_sku interchange
            intechange_skeleton(product)
          end
          ints.compact
        end
      end
    end
  end
end