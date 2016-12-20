require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/pets.rb' )


get '/pets' do
  @pets = Pet.all()
  erb(:"pets/index")
end

get '/pets/new' do
  @pets = Pet.all()
  erb(:'pets/new')
end  

post '/pets' do
  pet = Pet.new( params )
  pet.save()
  redirect to("/pets/#{pet.id}")
end

get '/pets/:id' do
  @pet = Pet.find( params[:id] )
  erb( :'pets/show' )
end  

post "/pets/:id/delete" do
  Pet.destroy(params[:id])
  redirect to('/pets')
end

get '/pets/:id/edit' do
  @pet = Pet.find( params[:id] )
  erb( :'pets/edit' )
end

post '/pets/:id' do
  @pet = Pet.update( params )
  redirect to( "/pets/#{ params[:id] }" )
end

#Students - Destroy
# post '/pets/:id/delete' do
#   Pet.destroy( params[:id] )
#   redirect to( "/pets" )
# end


