require 'bundler'

Bundler.require#(:default, ENV['SINATRA_ENV'])  

ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database => "db/development.sqlite"
)

# configure :development do
# 	set :database, {adapter: "sqlite3", database: "db/database.sqlite3"}
# end

require_all 'app'