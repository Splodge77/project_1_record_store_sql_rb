require_relative('../models/album.rb')
require_relative('../models/stock.rb')
require_relative('../models/artist.rb')
require('pry-byebug')

Album.delete_all()
Stock.delete_all()
Artist.delete_all()

artist1 = Artist.new({
  "name" => "Elbow"
  })
artist1.save

artist2 = Artist.new({
  "name" => "Muse"
  })
artist2.save

artist3 = Artist.new({
  "name" => "Led Zeppelin"
  })
artist3.save

artist4 = Artist.new({
  "name" => "Pink Floyd"
  })
artist4.save


album1 = Album.new({
  "title" => "Asleep in the Back",
  "artist_id" => artist1.id,
  "retail" => 10
  })
album1.save()

album2 = Album.new({
  "title" => "Absolution",
  "artist_id" => artist2.id,
  "retail" => 8
  })
album2.save()

album3 = Album.new({
  "title" => "Physical Graffiti",
  "artist_id" => artist3.id,
  "retail" => 12
  })
album3.save()

album4 = Album.new({
  "title" => "Dark Side of the Moon",
  "artist_id" => artist4.id,
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
