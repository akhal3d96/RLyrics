load 'lyrics.rb'
load 'song.rb'
load 'fetch.rb'
song = Fetch.AZLyrics("camel+lady+fantasy")
p song
song.lyrics.each
