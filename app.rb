require('sinatra')
require('sinatra/contrib/all')
require_relative('models/album.rb')
require_relative('models/stock.rb')
require_relative('controllers/albums_controller.rb')
require_relative('controllers/stocks_controller.rb')
require_relative('controllers/artists_controller.rb')

get('/') do
  @stocks = Stock.all()
  erb (:index)
end
