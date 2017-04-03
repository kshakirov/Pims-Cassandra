require_relative 'indexer_helper'
elastic_host = get_elastic_host
tcas_host = get_tcas_host

index_manager = TurboCassandra::ElasticIndex.new(elastic_host, tcas_host)
counter = 1
YAML.load_stream(File.open(File.expand_path( '../data/all_applications.yml', File.dirname(__FILE__)))) do |document|
  puts "Added Document [#{counter}]"
  index_manager.add_application document
  counter += 1
end

