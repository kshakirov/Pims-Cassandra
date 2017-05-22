require_relative '../tools_helper'

currency_api = TurboCassandra::API::Currency.new
currencies =  [
         {
             code: 'EUR', base: false, rate: 0.87
         },
         {
             code: 'USD', base: true, rate: 1.0
         },
         {
             code: 'GBP', base: false, rate: 0.8146
         }
     ]
currencies.each{|c| currency_api.update c}