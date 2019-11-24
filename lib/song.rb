require 'pry'

class Song
  attr_accessor :name, :artist_name
  
  @@all = []

  def initialize(name=nil, artist=nil)
    @name = name
    @artist_name = artist_name
    @@all << self 
  end 

  def self.all
    @@all
  end

  def self.create
    Song.new
  end 

  def self.new_by_name(name)
    Song.new(name)
  end

  def self.create_by_name(name)
    Song.new(name)
  end 

  def self.find_by_name(name)
    Song.all.find{|song| song.name == name}
  end 

  def self.find_or_create_by_name(name)
      Song.create_by_name(name)
      Song.find_by_name(name)
  end 

  def self.alphabetical
    Song.all.sort_by { |song| song.name }
  end 
  
  def self.new_from_filename(filename)
    apple = filename.split(" - ")
    apples = apple.to_s.split(".")
    artist = apples[0]
    songs = apples[1]
    Song.new(songs, artist)
    binding.pry
  end 

end
