require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('../models/ship.rb')
require_relative('../models/piloted_ship.rb')

get '/ships' do
  @ships = Ship.all
  erb(:"ships/index")
end

post '/ships/:ship_id/delete' do
  ship = Ship.find(params[:ship_id].to_i)
  ship.delete
  redirect to '/ships'
end

get '/ships/:ship_id' do
  @ship = Ship.find(params[:ship_id].to_i)
  erb(:"ships/show")
end