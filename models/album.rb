require_relative('../db/sql_runner')

class Album

  attr_reader(:id, :name, :artist)

  def intialize(options)
    @id = options['id'].to_i if options['id'].to_i
    @name = options['name']
    @artist = options['artist']
  end

  def save
    sql =
    "INSERT INTO albums (name, artist)
    VALUES ($1, $2)
    RETURNING *;"
    values =
    [@name, @artist]
    result = SqlRunner.run(sql, values).first()
    @id = result['id'].to_i
  end

end
