require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('../models/upgrade.rb')

get '/upgrades' do
 @upgrades = Upgrades.all
 erb(:"upgrades/index")
end
