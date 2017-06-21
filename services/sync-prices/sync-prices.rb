#!/usr/bin/env ruby
# encoding: utf-8


require 'timers'
require_relative '../../tools/sync/sync_helper'

timers = Timers::Group.new
price_updater = TurboCassandra::Sync::Price::PriceUpdater.new

now_and_every_day = timers.now_and_every(24 * 60 * 60) do
  $stdout.puts " ################# STARTING PRICE SYNC( #{Time.now}) ########"
  price_updater.run
  $stdout.puts " ################# ENDING  PRICE SYNC (#{Time.now}) ########"
end

loop {timers.wait}