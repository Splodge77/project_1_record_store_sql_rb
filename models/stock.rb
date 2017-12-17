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
end
