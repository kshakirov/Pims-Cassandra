require 'cassandra'
require 'active_support'
require 'active_support/all'
require 'elasticsearch'
require 'yaml'
require 'json'
require 'action_view'
require 'carmen'
require_relative '../../../lib/sources'
require_relative '../../../lib/Search/search_src'


def get_elastic_host
  config = YAML.load_file(File.expand_path( '../../../config/config.yml', File.dirname(__FILE__)))
  if not config.nil?
    config[ENV['TURBO_MODE']]['elastic_host']
  else
    puts "SET ELASTIC_INSTANCE VARIABLE"
    exit 1
  end
end

def get_index_name
  "turbointernational_#{ENV['TURBO_MODE'].downcase}"
end

