require_relative 'indexer_helper'

elastic_host = get_elastic_host
index_name = get_index_name
index_manager = TurboCassandra::ElasticIndex.new(elastic_host, index_name)
attributes = read_attributes_from_file
index_manager.put_mapping  index_name, 'product'
index_manager.put_critical_mapping index_name, 'product', attributes