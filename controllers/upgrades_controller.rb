require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('../models/upgrade.rb')

get '/upgrades' do
 @upgrades = Upgrade.all
 erb(:"upgrades/index")
end

get '/upgrades/new' do
 erb(:"upgrades/new")
end

post '/upgrades' do
  upgrade = Upgrade.new(params)
  upgrade.save
  redirect to '/upgrades'
end

post '/upgrades/:upgrade_id/delete' do
  upgrade = Upgrade.find(params[:upgrade_id].to_i)
  upgrade.delete
  redirect to '/upgrades'
end

get '/upgrades/:upgrade_id/edit' do
  @upgrade = Upgrade.find(params[:upgrade_id].to_i)
  erb(:"upgrades/edit")
end

post '/upgrades/:id/update' do
  upgrade = Upgrade.new(params)
  upgrade.update
  redirect to '/upgrades'
end