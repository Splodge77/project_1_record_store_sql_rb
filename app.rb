require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/albums_controller.rb')
require_relative('controllers/stocks_controller.rb')

get('/') do
  erb (:index)
end
