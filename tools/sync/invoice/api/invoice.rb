module TurboCassandra
  module Sync
    module Invoice
      class Rest
        def initialize metadata_server, metadata_server_port=8080
          @metadata_server = metadata_server
          @metadata_server_port = metadata_server_port
        end

        def query_update_by_time milisecs, limit=0
            response = RestClient.get("http://#{@metadata_server}:#{@metadata_server_port.to_s}/metadata/magmi/invoice/history?startDate=#{milisecs}&limitDays=#{limit}")
          JSON.parse response.body
        end

        def query_initial
          response = RestClient.get("http://#{@metadata_server}:#{@metadata_server_port.to_s}/metadata/magmi/invoice/history?limitDays=0")
          JSON.parse response.body
        end
      end

    end
  end
end