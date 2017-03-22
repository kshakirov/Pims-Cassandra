module TurboCassandra
  module Controller
    class ProductCreatedAt
      include Pagination
      private
      def tuuid_2_time results
        results.map do |r|
          r['created_at'] = r['created_at'].to_time
          r
        end

      end
      public
      def initialize
        @product_created_at_api = TurboCassandra::API::ProductCreatedAt.new
      end
      def where body
        body = JSON.parse body
        paging_state = get_paging_state(body)
        response = @product_created_at_api.where(body['manufacturer'], body['part_type'],
        body['page_size'], paging_state)
        response[:paging_state] = bin_to_hex(response[:paging_state]) if response[:paging_state]
        response[:results] = tuuid_2_time(response[:results])
        response
      end
    end
  end
end