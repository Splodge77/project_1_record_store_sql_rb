require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/stock.rb')

get('/stock') do
  @stocks = Stock.all()
  @album = Album.all()
  erb (:"stocks/index")
end
