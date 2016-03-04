load 'check.rb'
load 'fetch.rb'
load 'id3.rb'
load 'lyrics.rb'

def get_lyrics(query,my_song=nil)

	song = Fetch.AZLyrics(query)
	if my_song != nil
		song.title = my_song.title
		song.artist = my_song.artist
	end
	return song
end


file = 1
search = 0
query = ARGV.join("+")

if Check.get_type(query) == 1
	song = ID3Tag.get(ARGV[0])
	lyrics = Lyrics.search(song,"lyrics.json")
	if lyrics.size == 0
		search_text = "#{song.artist}+#{song.title}"
		new_song = get_lyrics(search_text,song)
		new_song.lyrics.each{|line| 
			if !line.match("Usage of azlyrics.com content by any third-party lyrics provider is prohibited by our licensing agreement. Sorry about that.")
			print line.gsub("NEWLINE","\n")
			end}
		p "Do you want to save the lyrics?[y,n]"
		ans = STDIN.gets
		if ans.chomp == "y"
			Lyrics.save(new_song,"lyrics.json")
		end
	else
		p song
		lyrics.each {|line|
		       #print line.gsub("NEWLINE","\n")	
			if line == "Usage of azlyrics.com content by any third-party lyrics provider is prohibited by our licensing agreement. Sorry about that."
				#Do Nothing
			else
					print line.gsub("NEWLINE","\n")
		
			end
		}	
	end	
else
	song = get_lyrics(query)
	p song
	song.lyrics.each{|line| 
		if !line.match("Usage of azlyrics.com content by any third-party lyrics provider is prohibited by our licensing agreement. Sorry about that.")
		print line.gsub("NEWLINE","\n")
		end}

end

