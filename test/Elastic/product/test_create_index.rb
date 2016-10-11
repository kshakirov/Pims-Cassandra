require_relative 'test_helper'

index_name = "magento_product"
client = Elasticsearch::Client.new(host: '10.1.3.16', log: true)
client.transport.reload_connections!

unless client.indices.exists? index: index_name
  client.indices.create index: index_name
end
p client.cluster.health