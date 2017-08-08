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
require_relative 'config/initializers/jwt_auth'
require_relative 'config/initializers/exception_handling'
require 'multi_json'

puts "RACK_ENV = #{ENV['RACK_ENV']}"
#\ -w -p 4701

Dir.glob('./app/{helpers,controllers}/*.rb').each { |file| require file }
map('/admin') { run ProductController }