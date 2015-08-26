# == Schema Information
#
# Table name: tickets
#
#  id                    :integer          not null, primary key
#  user_id               :integer
#  crn                   :string(255)
#  msp_name              :string(255)
#  client                :string(255)
#  participant_name      :string(255)
#  participant_mobile_no :string(255)
#  participant_email     :string(255)
#  category              :string(255)      default(""), not null
#  description           :text(65535)
#  forwarded_to          :string(255)
#  age_of_complaint      :string(255)
#  remark                :string(255)
#  resolution_period     :string(255)
#  status                :string(255)      default("New"), not null
#  priority              :string(255)      default(""), not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

require 'test_helper'

class TicketTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
