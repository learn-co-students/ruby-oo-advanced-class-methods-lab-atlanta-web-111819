class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    self.all << song
    song
  end

  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    self.all << song
    song
  end

  def self.create_by_name(song_name)
    self.new_by_name(song_name)
  end

  def self.find_by_name(song_name)
    @@all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    song =  Song.find_by_name(song_name) 
    song ? song : Song.create_by_name(song_name) 
  end

  def self.alphabetical
    @@all.sort {|song1, song2 | song1.name <=> song2.name}
  end

  def self.new_from_filename(file_name)
    pieces = file_name.split(' - ')
    artist = pieces[0]
    title = pieces[1][0..-5]
    song = Song.new
    song.name = title
    song.artist_name = artist
    song
  end

  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    @@all << song
  end

  def self.destroy_all
    @@all = []
  end

end
