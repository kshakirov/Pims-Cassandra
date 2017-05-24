require_relative 'indexer_helper'
elastic_host = get_elastic_host
index_name = get_index_name
index_manager = TurboCassandra::ElasticIndex.new(elastic_host, index_name)
index_manager.delete index_name