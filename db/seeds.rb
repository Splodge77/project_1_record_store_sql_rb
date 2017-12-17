require_relative('../models/album.rb')

Album.delete_all()

album1 = Album.new({
  "title" => "Asleep in the Back",
  "artist" => "Elbow"
  })

album1.save()
