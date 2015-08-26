# == Schema Information
#
# Table name: plans
#
#  id           :integer          not null, primary key
#  plan_name    :string(255)
#  ticket_limit :integer
#  validity     :integer
#  base_amount  :integer
#  service_tax  :float(24)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class PlanTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
