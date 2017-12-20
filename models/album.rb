require_relative('../db/sql_runner')
require('pry-byebug')

class Album

  attr_accessor :title, :artist_id, :retail, :wholesale
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id'].to_i
    @title = options['title']
    @artist_id = options['artist_id'].to_i if options['artist_id'].to_i
    @retail = options['retail'].to_i
    @wholesale = options['wholesale'].to_i
  end

  def save()
    sql =
    "INSERT INTO albums (title, artist_id, retail, wholesale)
    VALUES ($1, $2, $3, $4)
    RETURNING id;"
    values =
    [@title, @artist_id, @retail, @wholesale]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    SqlRunner.run("UPDATE albums
      SET (title, artist_id, retail, wholesale) = ($1,$2,$3,$4) WHERE id = $5",
      [@title, @artist_id, @retail, @wholesale, @id])
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

  def self.find(id)
    result = SqlRunner.run("SELECT * FROM albums
      WHERE id = $1", [id]).first()
      album = Album.new(result)
      return album
  end

  def self.map_items(hashes)
    results = hashes.map{|hash| Album.new(hash)}
    return results
  end


end
