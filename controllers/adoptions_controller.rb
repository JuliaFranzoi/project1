require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/adoption.rb' )


get '/adoptions' do
  @adoptions = Adoption.all
  erb ( :"adoption/index" )
end

get '/adoptions/new' do
  @pets = Pet.all.select { |pet| pet.is_adoptable? }
  @owners = Owner.all
  erb(:"adoption/new")
end

post '/adoptions' do
  adoption= Adoption.new(params)
  adoption.save()
  redirect to("/adoptions")
end

get '/adoptions/:id' do
  @adoption = Adoption.find( params[:id] )
  erb( :'adoptions/show' )
end 

post '/adoptions/:id/delete' do
  Adoption.destroy(params[:id])
  redirect to("/adoptions")
end

get '/adoptions/:id/edit' do
  @adoptions= Adoption.find( params[:id] )
  erb( :'adoption/edit' )
end

post '/adoptions/:id' do
  @adoption = Adoption.update( params )
  redirect to( "/adoptions/#{ params[:id] }" )
end

