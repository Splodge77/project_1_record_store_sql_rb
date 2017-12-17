require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/stock.rb')

get('/stock') do
  @stock = Album.all()
  erb (:"stock/index")
end
