require 'cassandra'
require 'active_support'
require 'active_support/all'
require 'elasticsearch'
require 'rest-client'
require 'yaml'
require 'json'
require_relative '../../../lib/sources'
require_relative '../../../lib/Search/search_src'
require 'minitest/autorun'
require 'minitest/pride'
ENV['TURBO_MODE'] = "development"

def read_attributes_from_file
  fd = File.open(__dir__ + '/../../attribute.json', 'r')
  data = fd.read
  JSON.parse data
end

def get_elastic_host
  config = YAML.load_file(File.expand_path( '../../../config/config.yml', File.dirname(__FILE__)))
  if not config.nil?
    config[ENV['TURBO_MODE']]['elastic_host']
  else
    puts "SET ELASTIC_INSTANCE VARIABLE"
    exit 1
  end
end

def get_tcas_host
  config = YAML.load_file(File.expand_path( '../../../config/config.yml', File.dirname(__FILE__)))
  if not config.nil?
    config[ENV['TURBO_MODE']]['tcas_host']
  else
    puts "SET ELASTIC_INSTANCE VARIABLE"
    exit 1
  end
end