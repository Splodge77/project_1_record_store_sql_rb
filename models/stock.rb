require_relative('../db/sql_runner.rb')
require('pry-byebug')

class Stock

  attr_reader :id
  attr_accessor :album_id, :quantity

  def initialize(options)
    @id = options['id'].to_i if options['id'].to_i
    @album_id = options['album_id'].to_i
    @quantity = options['quantity'].to_i
  end

  def save
    result = SqlRunner.run("INSERT INTO stocks (album_id, quantity)
    VALUES ($1,$2) RETURNING id;", [@album_id, @quantity])
    @id = result.first()['id'].to_i
  end

  def update()
    SqlRunner.run("UPDATE stocks
      SET (album_id, quantity) = ($1,$2) WHERE id = $3",
      [@album_id, @quantity, @id])
  end

  def delete
    SqlRunner.run("DELETE FROM stocks WHERE id = $1", [@id])
  end

  def album()
    album = Album.find(@album_id)
    return album
  end

  def increment()
    SqlRunner.run("UPDATE stocks SET (quantity) = (quantity + $1)
    WHERE id = $2", [@quantity, @id])
  end

  def level()
    if @quantity < 10
      return 'Low'
    elsif @quantity > 30
      return 'High'
    elsif @quantity > 50
      return 'V.High!'
    else
      return 'Normal'
    end
  end

  def self.destroy(id)
    SqlRunner.run("DELETE FROM stocks WHERE id = $1", [id])
  end

  def self.all()
    results = SqlRunner.run("SELECT * FROM stocks;")
    return Stock.map_items(results)
  end

  def self.delete_all()
    SqlRunner.run('DELETE FROM stocks;')
  end

  def self.map_items(hashes)
    results = hashes.map{|hash| Stock.new(hash)}
    return results
  end

  def self.find(id)
    result = SqlRunner.run("SELECT * FROM stocks
      WHERE id = $1", [id]).first()
      stock = Stock.new(result)
      return stock
  end
end
