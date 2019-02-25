class Song # create songs & send artist name STRING to ARTIST CLASS
  attr_accessor :name, :artist
  def initialize(name)
    @name = name
    @artist = artist
  end

  def artist_find_or_create(name) ######DOES THIS NEED TO EXIST OR CAN I CALL STRAIGHT FROM ARTIST CLASS????
    obj = Artist.find_or_create_by_name(name)
    #obj.save
  end

  def self.new_by_filename(filename)
    #parse the file for the song and artist
    file_split = filename.split(/-/)
    artist_name = file_split[0].strip
    song_name = file_split[1].strip

    #create new song instance
    song_object = Song.new(song_name)

    #associate new song instance with an artist
    song_object.artist = song_object.artist_find_or_create(artist_name)


    #return new song instance
    song_object
  end


end
