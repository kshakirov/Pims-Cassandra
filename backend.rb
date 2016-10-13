require 'sinatra'
require 'json'
require 'cassandra'
require_relative 'lib/sources'



set :bind, '0.0.0.0'
set :port, 4700

configure do
  set :menuBackEnd,  TurboCassandra::MenuBackEnd.new
end

before do
  content_type :json
end

get '/frontend/menu/manufacturer' do
    settings.menuBackEnd.get_manufacturers
end

get '/frontend/menu/critical' do
  settings.menuBackEnd.get_parts
end


get '/frontend/menu/part' do
  settings.menuBackEnd.get_parts
end

get '/frontend/menu/currency' do
  settings.menuBackEnd.get_currencies
end

get '/frontend/menu/product/featured' do
  settings.menuBackEnd.get_featured_product
end

get '/frontend/menu/product/new' do
  settings.menuBackEnd.get_new_product
end

