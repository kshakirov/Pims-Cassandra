require 'rest-client'
require 'json'
require 'cassandra'
require 'digest'
require 'jwt'
require 'yaml'
require 'logger'
require "march_hare"
require 'action_mailer'
require 'active_support'
require 'active_support/all'
require 'securerandom'
require 'prawn'
require 'prawn/table'
require_relative '../../lib/sources'
require_relative 'product/console/tcas_client'
require_relative 'product/api/product'
require_relative '../../tools/search/product/indexer_helper'
ENV['TURBO_MODE'] = "development"

def get_tcas_host
  config = YAML.load_file(File.expand_path('../../config/config.yaml', File.dirname(__FILE__)))
  if not config.nil?
    config[ENV['TURBO_MODE']]['tcas_host']
  else
    puts "SET ELASTIC_INSTANCE VARIABLE"
    exit 1
  end
end