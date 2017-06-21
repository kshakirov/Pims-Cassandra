module TurboCassandra
  module Sync
    module Price
      class PriceUpdater
        def initialize
          @product_model =TurboCassandra::Model::ProductCreatedAt.new
          @price_rest = TurboCassandra::Sync::Price::Rest.new
          @group_price_api = TurboCassandra::API::GroupPrice.new
        end

        private

        def update_product_prices prices
          prices.each do |price|
            @group_price_api.update_attributes price['partId'],
                                               {prices: price['prices'],
                                                standardprice: price['standardPrice']}
          end
        end


        def process_response paging_state
          response = @product_model.paginate_by_manufacturer "Turbo International", 100, paging_state
          update_product_prices(@price_rest.run response[:results])
          return response[:last], response[:paging_state]
        end

        public
        def run
          counter = 0
          paging_state = nil
          last_batch = false

          until last_batch do
            last_batch, paging_state = process_response paging_state
            counter+=1
            puts "Processed   [#{counter * 100}] Products"
          end
        end
      end
    end
  end
end
