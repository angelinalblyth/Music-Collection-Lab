require("pry-byebug")
require_relative("../models/album")
require_relative("../models/artist")

artist1 = Artist.new({'name' => 'Ozzy Osbourne'})
artist1.save()
artist2 = Artist.new({'name' => 'Alexisonfire'})
artist2.save()
artist3 = Artist.new({'name' => 'Meshuggah'})
artist3.save()
artist4 = Artist.new({'name' => 'The Hives'})
artist4.save()
artist5 = Artist.new({'name' => 'In This Moment'})
artist5.save()




binding.pry
nil
