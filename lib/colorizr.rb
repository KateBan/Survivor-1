
class String
	@@color_codes = { red: 31,
						green: 32,
						yellow: 33,
						blue: 34,
						pink: 95,
						light_blue: 94,
						white: 97,
						light_grey: 37,
						black: 30}

	def self.colors
		colors = []
		colors.push(@@color_codes.keys)
		return colors
	end
    
    # I implemented two ways to write the create_colors method
    # by calling class_eval and define_method work.
    # I am using Method I here,
    # but If you uncomment Method II you can test it too.

    # Method I with class_eval
	 def self.create_colors
    	@@color_codes.each do |color, value|
      		color_method = %Q{
        		def #{color}
          			return "\e[#{value}m" + self + "\e[0m"
        		end
      			}
      class_eval(color_method)
    end
    end

    # Method II with define_method
    # def self.create_colors
    # 	@@color_codes.each do |color, value|
    # 		self.send(:define_method, "#{color}") do
    # 			return "\e[#{value}m" + self + "\e[0m"
    # 		end
    # 	end
    # end

	self.create_colors

	def self.sample_colors
		@@color_codes.each do |color, value|
			puts "I am #{color}".send(color)
		end
	end	
end

puts String.sample_colors