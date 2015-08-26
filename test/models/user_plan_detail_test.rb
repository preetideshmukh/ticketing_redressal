# == Schema Information
#
# Table name: user_plan_details
#
#  id                :integer          not null, primary key
#  plan_id           :integer
#  payment_detail_id :integer
#  user_id           :integer
#  ticket_count      :integer
#  validity          :integer
#  valid_from        :date
#  valid_to          :date
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class UserPlanDetailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
