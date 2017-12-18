require_relative('../db/sql_runner')
require('pry-byebug')

class Album

  attr_accessor :title, :artist, :retail
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id'].to_i
    @title = options['title']
    @artist = options['artist']
    @retail = options['retail'].to_i
  end

  def save()
    sql =
    "INSERT INTO albums (title, artist, retail)
    VALUES ($1, $2, $3)
    RETURNING *;"
    values =
    [@title, @artist, @retail]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    SqlRunner.run("UPDATE albums
      SET (title, artist, retail) = ($1,$2,$3) WHERE id = $4",
      [@title, @artist, @retail, @id])
  end

  def delete
    SqlRunner.run("DELETE FROM albums WHERE id = $1", [@id])
  end

  def self.all()
    results = SqlRunner.run("SELECT * FROM albums;")
    return Album.map_items(results)
  end

  def self.delete_all()
    SqlRunner.run('DELETE FROM albums;')
  end

  # def self.find(id)
  #   result = SqlRunner.run("SELECT * FROM albums
  #     WHERE id = $1", [id]).first()
  #     album = Album.new(result)
  #     return album
  # end

  def self.map_items(hashes)
    results = hashes.map{|hash| Album.new(hash)}
    return results
  end


end
