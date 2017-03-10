require 'cassandra'
require 'active_support'
require 'active_support/all'
require 'elasticsearch'
require 'rest-client'
require 'yaml'
require 'json'
require_relative '../../../lib/sources'
require_relative '../../../lib/tools/Search/product/utils'
require_relative '../../../lib/tools/Search/product/index'
require_relative '../../../lib/tools/Search/product/mapping'
require_relative '../../../lib/tools/Search/product/product_transformer'
require_relative '../../../lib/tools/Search/product/ti_interchange'
require_relative '../../../lib/tools/Search/product/oe_ref_url'
require_relative '../../../lib/tools/Search/product/critical_dimensions'
require_relative '../../../lib/tools/Search/product/manufacturer'
require_relative '../../../lib/tools/Search/product/part_type'
require_relative '../../../lib/tools/Search/product/visibility'
require_relative '../../../lib/tools/Search/product/price_manager'
require_relative '../../../lib/tools/Search/product/ti_chra_manager'
require_relative '../../../lib/tools/Search/product/application'
require 'minitest/autorun'
require 'minitest/pride'

def read_attributes_from_file
  fd = File.open(__dir__ + '/../../attribute.json', 'r')
  data = fd.read
  JSON.parse data
end