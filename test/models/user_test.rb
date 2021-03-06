# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  firstname              :string(255)      default(""), not null
#  lastname               :string(255)      default(""), not null
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  mobile_no              :string(255)      default(""), not null
#  address_1              :string(255)      default(""), not null
#  role                   :string(255)
#  is_admin               :boolean          default("0")
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  configuration_status   :boolean          default("0")
#  code_name              :string(255)
#  customer_care_code     :string(255)
#  customer_care_number   :string(255)
#  customer_care_email    :string(255)
#  provider               :string(255)
#  uid                    :string(255)
#  company_name           :string(255)
#  is_active              :boolean          default("1")
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
