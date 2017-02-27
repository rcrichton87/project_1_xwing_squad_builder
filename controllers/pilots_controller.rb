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

post '/pilots/:ship_id' do
  pilot = Pilot.new(params)
  pilot.save
  redirect to "/pilots/#{params[:ship_id].to_i}"
end

get '/pilots/:pilot_id/edit' do
  @pilot = Pilot.find(params[:id].to_i)
  erb(:"pilots/edit")
end 