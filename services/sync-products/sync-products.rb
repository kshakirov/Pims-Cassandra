#!/usr/bin/env ruby
# encoding: utf-8

require 'timers'
require_relative '../../tools/sync/sync_helper'
require_relative '../../tools/sync/product/console/product_updater'

timers = Timers::Group.new
updater = TurboCassandra::Sync::Product::Updater.new get_elastic_host, get_index_name, get_metdata_host

now_and_every_ten_minutes = timers.now_and_every(10 * 60) do
  $stdout.puts " ################# STARTING DUMP( #{Time.now}) ########"
  updater.run
  $stdout.puts " ################# ENDING  DUMP (#{Time.now}) ########"
end

loop {timers.wait}
