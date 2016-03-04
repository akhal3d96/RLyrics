require 'json'

module DB
	def self.read(file)
		file = File.open("#{Dir.home}/#{file}","a+")
		json = JSON.load(file)
		return json
	end

	def self.write(hash,file)
		"""
		{'songs':[
		{'artist':'Radiohead', 'title':'Paranoid Android','lyrics':'Could You'},
		{'artist':'Camel', 'title':'Lady Fantasy','lyrics':'I have seen a lady'}
		]}
		"""
		#json_element = "{'artist':'#{song.artist}','title':'#{song.title}','lyrics':'#{lyrics}'},"
		#json_object = get_json(object)
		#f = File.open("#{Dir.home}/#{file}","w+")
		json = DB.read(file)
		
                if !json.nil?
                    json << hash
                else
                    json = hash
                end
		#p json

		File.open("#{Dir.home}/#{file}","w") do |f|
			f.puts JSON.pretty_generate(json)
		end

	
	end
	
	def check_file
		#TODO check is the JSON file is existed with the first header
	end
end



