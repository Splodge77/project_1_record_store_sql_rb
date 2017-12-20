require('../db/sql_runner')
require('pry-byebug')

class Purchase

  attr_reader :id
  attr_accessor :album_id, :stock_id

  def initialize(options)
    @id = (options['id']).to_i if (options['id']).to_i
    @album_id = (options['album_id']).to_i
    @stock_id = (options['stock_id']).to_i
  end
end
