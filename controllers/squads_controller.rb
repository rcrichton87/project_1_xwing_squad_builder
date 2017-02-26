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

get '/squads/new' do
  erb(:"squads/new")
end

post '/squads' do
  squad = Squad.new(params)
  squad.save
  redirect to '/squads'
end

get '/squads/:id/piloted_ships/new' do
  @squad = Squad.find(params[:id].to_i)
  erb(:"piloted_ships/new")
end

post '/squads/:id/piloted_ships' do
  pilot = Pilot.find(params[:pilot_id].to_i)
  ship = pilot.ship
  piloted_ship = PilotedShip.new({ 'pilot_id' => pilot.id, 'ship_id' => ship.id, 'squad_id' => params[:id].to_i })
  piloted_ship.save 
  redirect to '/squads'
end

get '/squads/:id' do
  @squad = Squad.find(params[:id].to_i)
  erb(:"squads/show")
end

get '/squads/:squad_id/ship/:ship_id' do
  @squad = Squad.find(params[:squad_id].to_i)
  @ship = Ship.find(params[:ship_id].to_i)
  erb(:"piloted_ships/add_pilot")
end

post '/squads/:squad_id/piloted_ships/:ship_id/delete' do
  piloted_ship = PilotedShip.find(params[:ship_id].to_i)
  piloted_ship.delete
  redirect to '/squads'
end

get '/squads/:squad_id/piloted_ships/:ship_id/edit_ship' do

end



