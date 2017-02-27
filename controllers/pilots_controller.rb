require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('../models/pilot.rb')
require_relative('../models/ship.rb')

get '/pilots/:ship_id' do
  @ship = Ship.find(params[:ship_id].to_i)
  @pilots = @ship.pilots
  erb(:"pilots/index")
end