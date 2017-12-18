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

get('/stocks/:id') do
  @stocks = Stock.find(params['id'])
  erb(:"stocks/show")
end

get('/stocks/:id/update') do
  @stocks = Stock.find(params['id'])
  erb (:"stocks/update")
end

post('/stocks') do
  Stock.new(params).save
  redirect to ('/stocks')
end

put('/stocks/:id/update') do
  Stock.new(params['id']).update
  redirect to ('/stocks')
end
