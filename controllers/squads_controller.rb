require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('../models/squad.rb')
require_relative('../models/pilot.rb')
require_relative('../models/ship.rb')
require_relative('../models/piloted_ship.rb')

get '/squads' do
  @squads = Squad.all
  erb(:"squads/index")
end

post '/squads/:id/delete' do
  squad = Squad.find(params[:id].to_i)
  squad.delete
  redirect to '/squads'
end