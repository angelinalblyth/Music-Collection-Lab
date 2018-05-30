require('pg')
require_relative('../db/sql_runner')
require_relative('album')

class Artist

  def initialize(details)
    @id = details['id'].to_i
    @name = details['name']
  end

end
