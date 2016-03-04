# RLyrics
Simple scripts written in Ruby to smartly fetch - and optionally save for offline use - lyrics from AZLyrics.
 
**Requires**

    nokogiri
    id3lib-ruby

**Known Issues:**
 
 - Add [ to the beggining of the JSON file and ] at the end (easy to fix but I am busy).
 - It's badly designed (any improvments are welcome!). 
 - It isn't ready yet!

**TODO:** 

 - Save lyrics which weren't fetched from a file.
 - Directories search and discover.
 - Add other services.


**How to use:**

    $ ruby rlyrics.rb file_with_id3.mp3
    $ ruby rlyrics.rb song_artist song_name
