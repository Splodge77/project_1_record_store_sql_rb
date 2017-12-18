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

post('/albums') do
  Album.new(params).save
  redirect to ('/albums')
end
