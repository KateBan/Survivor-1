
class String
	@@colors_number = { red: 31,
						green: 32,
						yellow: 33,
						blue: 34,
						pink: 95,
						light_blue: 94,
						white: 97,
						light_grey: 37,
						black: 30}

	def self.colors
		colors_list = []
		colors_list.push(@@colors_number.keys)
		return colors_list
	end
end
puts String.colors