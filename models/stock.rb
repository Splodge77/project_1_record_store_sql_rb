require_relative('../db/sql_runner.rb')
require('pry-byebug')

class Stock

  attr_reader :id
  attr_accessor :album_id, :quantity

  def initialize(options)
    @id = options['id'].to_i if options['id'].to_i
    @album_id = options['album_id'].to_i
    @quantity = options['quantity']
  end

  def save
    result = SqlRunner.run("INSERT INTO stock (album_id, quantity)
    VALUES ($1,$2) RETURNING id;", [@album_id, @quantity])
    @id = result.first()['id'].to_i
  end

  def update()
    SqlRunner.run("UPDATE stock
      SET (album_id, quantity) = ($1,$2) WHERE id = $3",
      [@album_id, @quantity, @id])
  end

  def delete
    SqlRunner.run("DELETE FROM stock WHERE id = $1", [@id])
  end

  def self.all()
    results = SqlRunner.run("SELECT * FROM stock;")
    return Stock.map_items(results)
  end

  def self.delete_all()
    SqlRunner.run('DELETE FROM stock;')
  end

  def self.map_items(hashes)
    results = hashes.map{|hash| Stock.new(hash)}
    return results
  end
end
