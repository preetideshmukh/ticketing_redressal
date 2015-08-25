# == Schema Information
#
# Table name: transactions
#
#  id           :integer          not null, primary key
#  client_id    :integer
#  user_id      :integer
#  client_name  :string(255)
#  email        :string(255)
#  mobile_no    :string(255)
#  plan_id      :integer
#  plan_name    :string(255)
#  total_amount :float(24)
#  hash_val     :string(255)
#  txn_id       :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Transaction < ActiveRecord::Base
end
