require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/album.rb')
require_relative('../models/artist.rb')

get('/albums') do
  @albums = Album.all()
  @artists = Artist.all()
  erb (:"albums/index")
end

get('/albums/new') do
  @albums = Album.all()
  @artists = Artist.all()
  erb (:"albums/new")
end

get('/albums/:id') do
  @albums = Album.find(params['id'])
  erb(:"albums/show")
end

post('/albums') do
  Album.new(params).save
  redirect to ('/')
end

post('/albums/:id/destroy') do
  Album.destroy(params[:id])
  redirect to("/albums")
end
