require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/album.rb')

get('/albums') do
  @albums = Album.all()
  erb (:"albums/index")
end

get('/albums/new') do
  @albums = Album.all()
  erb (:"albums/new")
end
