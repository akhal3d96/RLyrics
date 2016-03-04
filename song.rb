#TODO use structs
class Song
	attr_accessor :artist, :title,:lyrics
	def initialize(artist,title,lyrics=nil)
		@artist = artist
		@title = title
		@lyrics = lyrics
	end
	#Overriden
	def inspect
	return "#{@artist} - #{@title}"
	end	

end
