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

get('/artists/:id') do
  @artists = Stock.find(params['id'])
  erb(:"artists/show")
end

post('/artists') do
  Artist.new(params).save
  redirect to ('/artists')
end

post('/artists/:id/destroy') do
  Artist.destroy(params[:id])
  redirect to("/artists")
end
