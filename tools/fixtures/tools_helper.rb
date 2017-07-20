require 'json'
require 'cassandra'
require 'active_support'
require 'active_support/all'
require 'action_view'
require 'yaml'
require 'logger'
require 'rest-client'
require 'erb'
require 'action_view/helpers'
require 'prawn'
require 'prawn/table'
require 'carmen'
require 'carmen/country'
require  'csv'
require_relative '../../lib/sources'


def check_environment r_path
  if ENV['TURBO_MODE']=='test'
    puts "TEST MODE"
    return "../../test/" + r_path
  end
  puts "PRODUCTION MODE"
  r_path
end


def read_product_from_file
  YAML.load_stream(open(File.expand_path(check_environment('data/all_products.yml'), File.dirname(__FILE__))))
end

def read_orders_from_file
  fd = File.open(
      File.expand_path(check_environment('data/orders.json'), File.dirname(__FILE__)), 'r'
  )
  data = fd.read
  JSON.parse data
end

def read_shipments_from_file
  fd = File.open(
      File.expand_path(check_environment('data/shipments.json'), File.dirname(__FILE__)), 'r'
  )
  data = fd.read
  JSON.parse data
end


def read_customers_from_file
  fd = File.open(
      File.expand_path(check_environment('data/customers_production.json'), File.dirname(__FILE__)), 'r'
  )
  data = fd.read
  JSON.parse data
end

def read_attribute_sets_from_file
  fd = File.open(
      File.expand_path(check_environment('data/attribute_sets_all.json'), File.dirname(__FILE__)), 'r'
  )
  data = fd.read
  JSON.parse data
end

def read_attributes_from_file
  fd = File.open(
      File.expand_path(check_environment('data/attribute.json'), File.dirname(__FILE__)), 'r'
  )
  data = fd.read
  JSON.parse data
end

def read_group_prices_from_file
  YAML.load_file(
      File.expand_path(check_environment('data/all_products.yml'), File.dirname(__FILE__))
  )
end