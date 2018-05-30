require('pg')
require_relative('../db/sql_runner')

class Artist

  attr_accessor :id, :name

  def initialize(details)
    @id = details['id'].to_i
    @name = details['name']
  end

  def save()
    sql = "INSERT INTO artists(name) VALUES($1) RETURNING id"
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def self.all()
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run(sql)
    return artists.map{|bands| Artist.new(bands)}
  end

end
