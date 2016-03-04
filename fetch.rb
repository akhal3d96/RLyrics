require 'nokogiri'
require 'open-uri'
load 'song.rb'

module Fetch
	def Fetch.get_text(elements)
		elements.select{ |e| e.class == Nokogiri::XML::Text }
		arr = []
		elements.each {|e| arr<<e.content.strip
			arr<<"NEWLINE"
		}
		arr
	end

	def Fetch.clean(element)
		element[1].split.map(&:capitalize).join(" ").gsub(/Lyrics/,"")
	end

	def Fetch.AZLyrics(query)
		#Get search page
		doc = Nokogiri::HTML(open('http://search.azlyrics.com/search.php?q='+query))
		#Parse search page and get lyrics link
		html_search_page = doc.css('tr')[0].children
		link = html_search_page.children[1].values[0]
		page = Nokogiri::HTML(open(link.to_s))
	     	
		artist = Fetch.clean(Fetch.get_text(page.css('div')[20].children))
		title = Fetch.get_text(page.css('div')[18].children)
		#title = Fetch.get_text(page.css('div')[18].children)
		#p title.class
		lyrics = Fetch.get_text(page.css('div')[22].children)
		#p "#{artist} - #{title}"
		return Song.new(artist,title.join(" ").gsub(/lyrics/,"").gsub(/\\/,""),lyrics)
		end
end




