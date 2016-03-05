#TODO use mixins to include DB module in Save module 
load 'DB.rb'

module Lyrics
	def self.search(song,file)
		lyrics = []
		json = DB.read(file)
		if json.nil? 
			p "nil"
			return lyrics
		end
		json.each  { |s|
			artist = s["artist"]
			title = s["title"]
			"""p artist
			p song.artist
			p title
			p song.title"""
			
			begin
			if artist.downcase.match(song.artist.downcase) and title.downcase.match(song.title.downcase)
				#p s["lyrics"]
				lyrics<<s["lyrics"]
			end
			rescue 
			end
			#p s["artist"]
		}
		#p lyrics
		return lyrics
	end
	def self.save(song,file)

		json_hash = {"artist" => song.artist,
	       	"title" => song.title,
		"lyrics" => song.lyrics.join(" ")
		}
		DB.write(json_hash,file)
	end
end
