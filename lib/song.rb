require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  # def initialize(name, artist_name)
  #   @name = name
  #   @artist_name = artist_name
  #   save
  # end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    new_song = new_by_name(name)
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    @@all.each do |song|
      if song.name == name
        return song
      end
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      self.create_by_name(name)
    else self.find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(file_name)
    song = Song.new
    song_array = file_name[0..file_name.length-5].split(' - ')
    song.name = song_array[1]
    song.artist_name = song_array[0]
    song
  end

  def self.create_from_filename(file_name)
    new_song = new_from_filename(file_name)
    new_song.save
  end

  def self.destroy_all
    @@all.clear
  end

end
