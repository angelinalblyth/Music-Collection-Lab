require("pry-byebug")
require_relative("../models/album")
require_relative("../models/artist")

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({'name' => 'Ozzy Osbourne'})
artist1.save()
artist2 = Artist.new({'name' => 'Alexisonfire'})
artist2.save()
artist3 = Artist.new({'name' => 'Thrice'})
artist3.save()
artist4 = Artist.new({'name' => 'Shinedown'})
artist4.save()
artist5 = Artist.new({'name' => 'In This Moment'})
artist5.save()
artist6 = Artist.new({'name' => 'Test DELETE'})
artist6.save()
# binding.pry

album1 = Album.new({'title' => 'No More Tears','genre' => 'Metal','artist_id' => artist1.id})
album1.save()
album2 = Album.new({'title' => 'Crisis','genre' => 'Post Hardcore', 'artist_id' => artist2.id})
album2.save()
album3 = Album.new({'title' => 'To Be Everywhere Is To Be Nowhere','genre' => 'Alt Rock', 'artist_id' => artist3.id})
album3.save()
album4 = Album.new({'title' => 'DEVIL','genre' => 'Rock', 'artist_id' => artist4.id})
album4.save()
album5 = Album.new({'title' => 'Blood','genre' => 'Alt Metal', 'artist_id' => artist5.id})
album5.save()
album6 = Album.new({'title' => 'Threat to Survival','genre' => 'Rock', 'artist_id' => artist4.id})
album6.save()

artist1.name = "John Michael 'Ozzy' Osbourne"
artist1.update

album1.genre = "Heavy Metal"
album1.update


binding.pry
nil
