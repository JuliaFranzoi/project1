require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( 'controllers/adoptions_controller.rb' )
require_relative( 'controllers/owners_controller.rb' )
require_relative( 'controllers/pet_controller.rb' )



get '/' do
  erb(:index)
end






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