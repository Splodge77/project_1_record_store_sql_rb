require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/stock.rb')

get('/stock') do
  @stocks = Stock.all()
  erb (:"stocks/index")
end
