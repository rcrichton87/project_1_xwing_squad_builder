require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('./models/pilot.rb')
require_relative('./models/ship.rb')
require_relative('./models/squad.rb')
require_relative('./models/piloted_ship.rb')
require_relative('./controllers/squads_controller.rb')

get '/' do
  erb(:index)
end
