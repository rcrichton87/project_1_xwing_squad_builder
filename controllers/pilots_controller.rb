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

get '/pilots/:ship_id/new' do
  @ship = Ship.find(params[:ship_id].to_i)
  erb(:"pilots/new")
end

post '/pilots/:id/update' do
  pilot = Pilot.new(params)
  pilot.update
  redirect to "/pilots/#{pilot.ship_id}"
end

post '/pilots/:pilot_id/delete' do
  pilot = Pilot.find(params[:pilot_id].to_i)
  pilot.delete
  redirect to "/pilots/#{pilot.ship_id}"
end

post '/pilots/:ship_id' do
  pilot = Pilot.new(params)
  pilot.save
  redirect to "/pilots/#{params[:ship_id].to_i}"
end

get '/pilots/:pilot_id/edit' do
  @pilot = Pilot.find(params[:pilot_id].to_i)
  erb(:"pilots/edit")
end 