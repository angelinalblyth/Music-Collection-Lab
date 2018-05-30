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

# Below gives an error if the artist has an album
  def delete()
    sql = "DELETE FROM artists WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end
# What I want to do for deleting an artist is
# check if the artist has an album.
# If they do delete the album or set the artist_id to nil/0
# then delete the artist
# if no album just go and delete the artist.

  def find_artist(id)
    sql = "SELECT * FROM artists where id = $1"
    values = [@id]
    persons = SqlRunner.run(sql,values)
    return persons.map{|person| Artist.new(person)}
  end
  #type SELECT * FROM artists WHERE id = 4
  #returns Shinedown which is correct.






end
