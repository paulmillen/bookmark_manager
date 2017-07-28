ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require_relative './models/link'
require_relative './models/tag'
require_relative './data_mapper_setup'

require_relative './server'
require_relative './controllers/links.rb'
require_relative './controllers/tags.rb'
require_relative './controllers/users.rb'
require_relative './controllers/sessions.rb'
