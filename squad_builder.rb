require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('./models/pilot.rb')
require_relative('./models/ship.rb')
require_relative('./models/squad.rb')
require_relative('./models/piloted_ship.rb')

get '/' do
  erb(:index)
end
