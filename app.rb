require 'active_record'
require 'bundler/setup'
require 'yaml'
Bundler.require

enable :sessions

module Play
  extend self

  def db_conf
    @db_conf ||= begin
      YAML.load_file(File.join(File.dirname(__FILE__), "config/database.yml"))[ENV["RACK_ENV"]]
    end
  end

  class App < Sinatra::Base

    configure do
      ActiveRecord::Base.schema_format = :sql
      ActiveRecord::Base.establish_connection(Play::db_conf)
    end

    get '/' do
      'Hello!?'
    end

    get '/:value' do
      session[:value] = params[:value]
      'OK'
    end

  end
end
