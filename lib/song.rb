require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name = nil, artist_name = nil)
    @name = name
    @artist_name = artist_name
  end


  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    @@all << Song.new
    @@all.last
  end

  def self.new_by_name(names)
    Song.new(names)
    
    # binding.pry
  end

  def self.create_by_name(names)
    @@all << Song.new(names)
    @@all.last
  end

  def self.find_by_name(names)
    temp = @@all.select{|song| song.name == names}
    temp[0]
  end

  def self.find_or_create_by_name(names)
    if self.find_by_name(names)
      self.find_by_name(names)
    else
      self.create_by_name(names)
    end
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(fname)
    temp = fname.split(/\.|\-/).map(&:strip)
    # binding.pry
    Song.new(temp[1], temp[0])
  end

  def self.create_from_filename(fname)
    temp = fname.split(/\.|\-/).map(&:strip)
    # binding.pry
    @@all << Song.new(temp[1], temp[0])

  end


  def self.destroy_all
    @@all = []
  end

end
