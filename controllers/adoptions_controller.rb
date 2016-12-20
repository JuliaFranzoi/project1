require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/adoption.rb' )




get '/adoptions' do
  @adoptions = Adoption.all
  erb ( :"adoption/index" )
end

get '/adoptions/new' do
  @pets = Pet.all
  @owners = Owner.all
  erb(:"adoption/new")
end

post '/adoptions' do
  adoption= Adoption.new(params)
  adoption.save()
  redirect to("/adoptions")
end

post '/adoptions/:id/delete' do
  Adoption.destroy(params[:id])
  redirect to("/adoptions")
end