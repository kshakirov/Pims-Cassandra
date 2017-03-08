require 'minitest/autorun'
require 'yaml'
require 'logger'
require 'cassandra'
require 'active_support'
require 'active_support/all'
require_relative '../../../lib/sources'
ENV['TURBO_MODE'] = "test"
