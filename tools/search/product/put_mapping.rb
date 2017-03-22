require_relative 'indexer_helper'

elastic_host = get_elastic_host
tcas_host = get_tcas_host
index_manager = TurboCassandra::ElasticIndex.new(elastic_host, tcas_host)

attributes = read_attributes_from_file
index_manager.put_mapping 'magento_product', 'product'
index_manager.put_critical_mapping 'magento_product', 'product', attributes