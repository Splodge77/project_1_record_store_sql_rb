require_relative('../models/album.rb')
require('pry-byebug')

Album.delete_all()

album1 = Album.new({
  "title" => "Asleep in the Back",
  "artist" => "Elbow"
  })

album1.save()

album2 = Album.new({
  "title" => "Absolution",
  "artist" => "Muse"
  })

album2.save()

album3 = Album.new({
  "title" => "Physical Graffiti",
  "artist" => "Led Zeppelin"
  })

album3.save()

album4 = Album.new({
  "title" => "Dark Side of the Moon",
  "artist" => "Pink Floyd"
  })

album4.save()

# album1.title = "Seldom Seen Kid"
# album1.update
binding.pry
nil
