require './app.rb'
require 'rack/session/redis'

use Rack::Session::Redis, :redis_server => 'redis://redis:6379'

run Play::App