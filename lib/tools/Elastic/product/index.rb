module TurboCassandra
  class ElasticIndex
    def initialize
      @client = Elasticsearch::Client.new(host: '10.1.3.16', log: true)
      @client.transport.reload_connections!
    end

    def create name
      unless @client.indices.exists? index: name
        @client.indices.create index: name
      end
    end
    def delete name
      if @client.indices.exists? index: name
        @client.indices.delete  index: name
      end
    end
    def put_mapping mapping

    end
  end
end
