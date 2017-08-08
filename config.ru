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
require_relative './config/initializers/sources'
require_relative 'rest/turbo/jwt_auth'
require_relative 'rest/turbo/exception_handling'
require_relative 'rest/turbo/mailer'
require 'multi_json'


#\ -w -p 4701
# run Rack::URLMap.new({
#                          '/' => AdminTest,
#
#                      })
# pull in the helpers and controllers
Dir.glob('./app/{helpers,controllers}/*.rb').each { |file| require file }
map('/') { run ProductController }