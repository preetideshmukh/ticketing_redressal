# == Schema Information
#
# Table name: forum_comments
#
#  id         :integer          not null, primary key
#  comment    :text(65535)
#  post_id    :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ForumComment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
end
