require 'sinatra/base'
require 'sinatra/config_file'
require "sinatra/cookies"
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
require 'action_view'
require 'securerandom'
require 'active_directory'
require 'prawn'
require 'prawn/table'
require 'erb'
require "base64"
require 'carmen'
require_relative '../../config/initializers/sources'
require_relative 'jwt_auth'
require_relative 'exception_handling'
require_relative 'mailer'
require 'multi_json'

class AdminTest < Sinatra::Base

  #use JwtAuth
  use ExceptionHandling
  register Sinatra::ConfigFile
  helpers Sinatra::Cookies

  before do
    content_type :json
  end

  get '/products/:sku' do
      ProductController .show params
  end

  after do
      response.body = JSON.dump(response.body)
  end
end