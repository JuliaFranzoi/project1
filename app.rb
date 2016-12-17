require( 'sinatra' )
require( 'sinatra/contrib/all' )
# require_relative( './models/adoption.rb' )
require_relative( './models/pets.rb' )
require_relative( './models/owners.rb' )



get '/' do
  erb(:welcome)
end

# get '/pets' do
#   @pets = Pet.all()
#   erb(:)
# end


# get '/adoption' do
#   @adopiton = Adoption.all
#   erb ( :"adoption/index" )
# end

# get '/adoption/new' do
#   @pets = Pet.all
#   @owners = Owner.all
#   erb(:"adoption/new")
# end

# post '/adoption' do
#   biting = Adoption.new(params)
#   adoption.save
#   redirect to("/adoption")
# end

# post '/adoption/:id/delete' do
#   Adoption.destroy(params[:id])
#   redirect to("/adoption")
# get '/pets