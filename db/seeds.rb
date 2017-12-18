require_relative('../models/album.rb')
require_relative('../models/stock.rb')
require('pry-byebug')

Album.delete_all()

album1 = Album.new({
  "title" => "Asleep in the Back",
  "artist" => "Elbow",
  "retail" => 10
  })

album1.save()

album2 = Album.new({
  "title" => "Absolution",
  "artist" => "Muse",
  "retail" => 8
  })

album2.save()

album3 = Album.new({
  "title" => "Physical Graffiti",
  "artist" => "Led Zeppelin",
  "ratail" => 12
  })

album3.save()

album4 = Album.new({
  "title" => "Dark Side of the Moon",
  "artist" => "Pink Floyd",
  "retail" => 12
  })

album4.save()

album1.title = "Seldom Seen Kid"
album1.update

stock1 = Stock.new({
  "album_id" => album1.id,
  "quantity" => 30,
  "wholesale" => 3
  })

stock1.save()

stock2 = Stock.new({
  "album_id" => album2.id,
  "quantity" => 40,
  "wholesale" => 3
  })

stock2.save()

binding.pry
nil
