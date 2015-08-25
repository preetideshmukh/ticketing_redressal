# == Schema Information
#
# Table name: payment_details
#
#  id             :integer          not null, primary key
#  plan_id        :integer
#  transaction_id :string(255)
#  plan_name      :string(255)
#  amount         :float(24)
#  mihpayid       :string(255)
#  payumoneyid    :integer
#  payment_status :string(255)
#  txn_response   :text(65535)
#  txn_added_on   :datetime
#  payee_mob_no   :string(255)
#  payee_email    :string(255)
#  checksum       :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer
#

class PaymentDetail < ActiveRecord::Base
	belongs_to :plan
end
