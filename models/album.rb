require('pg')
require_relative('../db/sql_runner')

class Album

  attr_accessor :id, :title, :genre, :artist_id

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums(title, genre, artist_id) VALUES($1,$2,$3) RETURNING id"
    values = [@title, @genre, @artist_id]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def self.all()
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run(sql)
    return albums.map{|album| Artist.new(album)}
  end

  def self.delete_all()
  sql = "DELETE FROM albums"
  SqlRunner.run(sql)
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    results = SqlRunner.run(sql, values)
    return results.map{|artist| Artist.new(artist)}
  end

  def update()
    sql = "UPDATE albums SET genre = $1 WHERE id = $2"
    values = [@genre, @id]
    SqlRunner.run(sql, values)
  end

end
