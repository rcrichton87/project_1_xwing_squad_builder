require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('../models/squad.rb')
require_relative('../models/pilot.rb')
require_relative('../models/ship.rb')
require_relative('../models/piloted_ship.rb') 

get '/piloted_ships/new' do
  erb(:"piloted_ships/new")
end

post '/piloted_ships/:squad_id' do
  pilot = Pilot.find(params[:pilot_id].to_i)
  ship = pilot.ship
  default_upgrades = ship.default_upgrades
  piloted_ship = PilotedShip.new({ 'pilot_id' => pilot.id, 'ship_id' => ship.id, 'squad_id' => params[:squad_id].to_i, 'piloted_ships_upgrades_id' => default_upgrades.id})
  piloted_ship.save
  redirect to "/squads/#{params[:squad_id].to_i}"
end