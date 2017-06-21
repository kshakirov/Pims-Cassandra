ENV['TURBO_MODE'] ='development'
require_relative '../../sync_helper'

price_updater = TurboCassandra::Sync::Price::PriceUpdater.new
price_updater.run

