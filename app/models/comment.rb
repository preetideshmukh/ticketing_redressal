# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  ticket_id  :integer
#  body       :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ActiveRecord::Base
	belongs_to :ticket
end
