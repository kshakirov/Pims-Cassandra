module TurboCassandra
  module TcasService
    private

    def query_bom_service sku
      response = RestClient.get(@tcas_server +  "/product/#{sku}/bom/")
      begin
        JSON.parse response.body
      rescue
        []
      end
    end

    def query_interchange_service sku
      response = RestClient.get(@tcas_server +  "/product/#{sku}/interchanges/")
      begin
        JSON.parse response.body
      rescue
        []
      end
    end
  end
end