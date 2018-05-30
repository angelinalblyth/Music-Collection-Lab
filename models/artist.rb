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

  def self.delete_all()
  sql = "DELETE FROM artists"
  SqlRunner.run(sql)
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map{|album| Album.new(album)}
  end

  def update()
    sql = "UPDATE artists SET name = $1 WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end





end
