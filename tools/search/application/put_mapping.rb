require_relative 'indexer_helper'

elastic_host = get_elastic_host
tcas_host = get_tcas_host
index_manager = TurboCassandra::ElasticIndex.new(elastic_host, tcas_host)

index_manager.put_application_mapping 'magento_product', 'application'