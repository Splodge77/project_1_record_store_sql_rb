require_relative('../db/sql_runner')
require('pry-byebug')

class Album

  attr_accessor :title, :artist
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id'].to_i
    @title = options['title']
    @artist = options['artist']
  end

  def save()
    sql =
    "INSERT INTO albums (title, artist)
    VALUES ($1, $2)
    RETURNING *;"
    values =
    [@title, @artist]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    SqlRunner.run("UPDATE albums
      SET (title, artist) = ($1,$2) WHERE id = $3",
      [@title, @artist, @id])
  end


  def self.all()
    results = SqlRunner.run("SELECT * FROM albums;")
    return Album.map_items(results)
  end

  def self.delete_all()
    SqlRunner.run('DELETE FROM albums;')
  end

  def self.map_items(hashes)
    results = hashes.map{|hash| Album.new(hash)}
    return results
  end

end
