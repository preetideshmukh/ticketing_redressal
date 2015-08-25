# == Schema Information
#
# Table name: tickets
#
class Ticket < ActiveRecord::Base
   belongs_to :user
   has_many :comments
  
  def self.priorities
    ['High','Medium','Low']
  end

  RANSACKABLE_ATTRIBUTES = ["participant_name", "crn"]

	def self.ransackable_attributes auth_object = nil
	  RANSACKABLE_ATTRIBUTES + _ransackers.keys
	end

def self.search(search)
  if search
    where('participant_name LIKE ? or id LIKE ?', "%#{search}%","%#{search}%")
  else
    all
  end
end

end