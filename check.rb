module Check

	def self.get_type(query)
		if query =~/(mp3|flac)$/
			return 1
		
		else
			return 0	
		end
	end
end
