require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/artist.rb')

get('/artists') do
  @artists = Artist.all()
  erb(:"/artists/index")
end

get('/artists/new') do
  @artists = Artist.all()
  erb(:"/artists/new")
end
