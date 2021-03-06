require 'bundler'
require 'sinatra/json'
require 'dotenv'
Dotenv.load('dotenv.env')
Bundler.require

# get the path of the root of the app
APP_ROOT = File.expand_path("..", __dir__)

# require the controller(s)
Dir.glob(File.join(APP_ROOT, 'app', 'controllers', '*.rb')).each { |file| require file }

# require the poro(s)
Dir.glob(File.join(APP_ROOT, 'app', 'poros', '*.rb')).each { |file| require file }

# require the services)
Dir.glob(File.join(APP_ROOT, 'app', 'services', '*.rb')).each { |file| require file }

# require database configurations
require File.join(APP_ROOT, 'config', 'database')

# configure SinatraPractice settings
class Server < Sinatra::Base
 set :method_override, true
 set :root, APP_ROOT
 set :views, File.join(APP_ROOT, "app", "views")
 set :public_folder, File.join(APP_ROOT, "app", "public")
end
