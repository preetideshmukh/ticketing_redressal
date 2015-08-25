class Home < ActiveRecord::Base
	def self.random_string(user_info)
	    #generate a random password consisting of strings and digits
	    chars = ("0".."9").to_a 
	    code = ""
	    1.upto(4) { |i| code << chars[rand(chars.size-1)]}
	    return user_info + code
	end
end
