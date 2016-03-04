require 'id3lib'
load 'song.rb'

module ID3Tag
	def self.get(file)
		tag = ID3Lib::Tag.new(file)
		#song = Struct.new(:artist,:title)
		#p "ID3=>"+tag.artist+" - "+tag.title
		return Song.new(tag.artist,tag.title)
	end

	#def self.format_to_json(song,lyrics)
	#	json_element = "{'artist':'#{song.artist}','title':'#{song.title}','lyrics':'#{lyrics}'},"
	#end
end
