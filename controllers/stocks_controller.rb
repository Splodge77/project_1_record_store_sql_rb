require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/stock.rb')
require_relative('../models/album.rb')

get('/stocks') do
  @stocks = Stock.all()
  @albums = Album.all()
  erb (:"stocks/index")
end

get('/stocks/new') do
  @albums = Album.all()
  erb (:"stocks/new")
end

post('/stocks') do
  Stock.new(params).save
  redirect to ('/stocks')
end
