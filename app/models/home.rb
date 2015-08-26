# == Schema Information
#
# Table name: homes
#
#  id         :integer          not null, primary key
#  code_name  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Home < ActiveRecord::Base
	def self.random_string(user_info)
	    #generate a random password consisting of strings and digits
	    chars = ("0".."9").to_a 
	    code = ""
	    1.upto(4) { |i| code << chars[rand(chars.size-1)]}
	    return user_info + code
	end
end
