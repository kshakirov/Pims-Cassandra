require 'minitest/autorun'
require 'minitest/pride'
require 'json'
require 'yaml'
require 'cassandra'
require 'active_support/all'
require 'action_view'
require 'carmen'
require_relative '../../config/initializers/sources'

ENV['TURBO_MODE'] = "test"