require_relative('../db/sql_runner.rb')
require('pry-byebug')

class Artist

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id'].to_i
    @name = options['name']
  end

  def save()
    result = SqlRunner.run("INSERT INTO artists (name)
    VALUES ($1) RETURNING id;", [@name])
    @id = result.first()['id'].to_i
  end

  def update()
    SqlRunner.run("UPDATE artists
      SET (name) = ($1) WHERE id = $2",
      [@name, @id])
  end

  def delete
    SqlRunner.run("DELETE FROM artists WHERE id = $1", [@id])
  end

  def self.all()
    results = SqlRunner.run("SELECT * FROM artists;")
    return Artist.map_items(results)
  end

  def self.delete_all()
    SqlRunner.run('DELETE FROM artists;')
  end

  def self.find(id)
    result = SqlRunner.run("SELECT * FROM artists
      WHERE id = $1", [id]).first()
      album = Artist.new(result)
      return album
  end

  def self.map_items(hashes)
    results = hashes.map{|hash| Artist.new(hash)}
    return results
  end

end
