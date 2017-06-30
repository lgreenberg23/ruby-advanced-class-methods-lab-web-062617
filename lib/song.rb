class Song
  
  	attr_accessor :name, :artist_name
  		@@all = []
  		

  	def self.create
	  	song = self.new
	    song.save
	    #return new song created
	    song
  	end

	def self.all
	    @@all
	end

	def save
		#song_class = self.class
		#song_class.all <<self
	    self.class.all << self
	end
  

	def self.new_by_name(name, artist_name='')
	  	song = self.new
	  	song.name = name
	  	song.artist_name = artist_name
	  	song
	end

	def self.create_by_name(name, artist_name='')
		song = self.new
	  	song.name = name
	  	song.artist_name = artist_name
		song.save
		song
	end

	def self.find_by_name(name)
    	@@all.detect{|song| song.name == name}
 	end


	def self.find_or_create_by_name(name)
		if self.find_by_name(name) == nil
			self.create_by_name(name)
		else
			self.find_by_name(name)
		end
	end

	def self.alphabetical
		array_of_names = []
		array_of_songs =[]
		self.all.each {|song| array_of_names << song.name}
		array_of_names.sort!
		
		i = 0
		while i < array_of_names.length
			array_of_songs.push(self.find_by_name(array_of_names[i]))
			i +=1
		end
		array_of_songs

	end


	def self.new_from_filename(filename)
		song_array = filename.split(" - ")
		artist_name = song_array[0]
		array_part_2 = song_array[1].split(".")
		name = array_part_2[0]
		format = array_part_2[1]
		self.new_by_name(name, artist_name)
	end

	def self.create_from_filename(filename)
		song_array = filename.split(" - ")
		artist_name = song_array[0]
		array_part_2 = song_array[1].split(".")
		name = array_part_2[0]
		format = array_part_2[1]
		self.create_by_name(name, artist_name)
	end

	def self.destroy_all
		@@all.clear
	end

end
