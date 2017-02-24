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

get '/squads/:id' do
  @squad = Squad.find(params[:id].to_i)
  erb(:"squads/show")
end



