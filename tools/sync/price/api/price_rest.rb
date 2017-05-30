module TurboCassandra
  module Sync
    module Price
      class Rest
        def initialize
          @url = 'timms.turbointernational.com:8080/magmi/prices?inputtype=id'
          @group_price_api = TurboCassandra::API::GroupPrice.new
        end

        private


        def update_group_price response
          group_price_hash = {
              sku: response['partId'],
              standardprice: response['standardPrice'] || 0.0,
              prices: response['prices'] || {}
          }
          @group_price_api.create group_price_hash unless  group_price_hash[:sku].nil?
        end

        def get ids
          response = RestClient.post @url, ids.to_json, :content_type => :json, :accept => :json
          unless response.nil?
            JSON.parse response
          end
        end

        def sync_prices response
          unless response.nil?
            response.each do |r|
              update_group_price r
            end
          end
        end
        public
        def run product_hashes
          ids = product_hashes.map { |hash| hash['sku'] }
          sync_prices(get ids)
        end
      end
    end
  end
end