require_relative 'indexer_helper'

elastic_host = get_elastic_host
elastic_index =  get_index_name
index_manager = TurboCassandra::ElasticIndex.new(elastic_host, elastic_index)
index_manager.put_application_mapping elastic_index, 'application'