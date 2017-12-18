require_relative('../db/sql_runner.rb')
require('pry-byebug')

class Stock

  attr_reader :id
  attr_accessor :album_id, :quantity, :wholesale

  def initialize(options)
    @id = options['id'].to_i if options['id'].to_i
    @album_id = options['album_id'].to_i
    @quantity = options['quantity']
    @wholesale = options['wholesale'].to_i
  end

  def save
    result = SqlRunner.run("INSERT INTO stock (album_id, quantity, wholesale)
    VALUES ($1,$2, $3) RETURNING id;", [@album_id, @quantity, @wholesale])
    @id = result.first()['id'].to_i
  end

  def update()
    SqlRunner.run("UPDATE stock
      SET (album_id, quantity) = ($1,$2,$3) WHERE id = $4",
      [@album_id, @quantity, @wholesale, @id])
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
