require_relative('../db/sql_runner')
require('pry-byebug')

class Album

  attr_reader(:id, :title, :artist)

  def initialize(options)
    @id = options['id'].to_i if options['id'].to_i
    @title = options['title']
    @artist = options['artist']
  end

  def save
    sql =
    "INSERT INTO albums (title, artist)
    VALUES ($1, $2)
    RETURNING *;"
    values =
    [@title, @artist]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.delete_all()
    SqlRunner.run('DELETE FROM albums;')
  end

end
