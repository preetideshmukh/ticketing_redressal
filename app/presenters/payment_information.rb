class PaymentInformation

  def calculate_tax(base_amount, service_tax)
    return (base_amount + (base_amount*service_tax)/100)
  end
  
  def unique_transaction_id
    trans_id = SecureRandom.random_number(999999999999)
    txn_length = trans_id.to_s.length
    if txn_length < 12
      trans_id = trans_id.to_s.rjust(12, '0')
    end
    return trans_id
  end
  
  def request_checksum(trans_id, client_plan_info)
    hash_string = "F1RWsU|#{trans_id}|#{client_plan_info[:total_amount]}|#{client_plan_info[:plan_name]}|#{client_plan_info[:client_name]}|#{client_plan_info[:email]}|||||||||||qEVhsZJn"
    #production--@hash_string = "Ul2bLo|#{@trans_id}|#{params[:client_plan][:total_amount]}|#{params[:client_plan][:plan_name]}|#{params[:client_plan][:client_name]}|#{params[:client_plan][:email]}|||||||||||uhuqGskx"
    checksum = Digest::SHA512.hexdigest(hash_string)
  end
  
  def response_checksum(txn_id, status)
    txn_data = Transaction.find_by txn_id: txn_id

    
    #production--@hash_string = "uhuqGskx|#{params[:status]}|||||||||||#{@txn_data.email}|#{@txn_data.client_name}|#{@txn_data.plan_name}|#{@txn_data.total_amount}|#{@txn_data.txn_id}|Ul2bLo"
    hash_string = "qEVhsZJn|#{status}|||||||||||#{txn_data.email}|#{txn_data.client_name}|#{txn_data.plan_name}|#{txn_data.total_amount}|#{txn_data.txn_id}|F1RWsU"
    user_checksum = Digest::SHA512.hexdigest(hash_string)
  end
  
  def store_payment_details(payment_response, checksum)
    txn_data = Transaction.find_by txn_id: payment_response[:txnid]
    payment = PaymentDetail.new(:user_id => txn_data.user_id,                                
                                :transaction_id => txn_data.txn_id,
                                :plan_id => txn_data.plan_id,
                                :plan_name => txn_data.plan_name,
                                :mihpayid => payment_response[:mihpayid],
                                :payumoneyid => payment_response[:payuMoneyId],
                                :payment_status => payment_response[:status],
                                :txn_response => payment_response,
                                :txn_added_on => payment_response[:addedon],
                                :amount => payment_response[:amount],
                                :payee_mob_no => payment_response[:phone],
                                :payee_email => payment_response[:email],
                                :checksum => checksum)
    if payment.save!
      if payment.payment_status == "success"
        txn_success_mail(payment_response[:txnid])
        set_validity_for_plan(payment)
      end
    end
  end

  def set_validity_for_plan(payment)
    client_plan = UserPlanDetail.where("user_id = ?", payment.user_id).last
    plan_detail = Plan.find(payment.plan_id)
    new_plan = UserPlanDetail.new(:user_id => payment.user_id,                                    
                                    :plan_id => payment.plan_id,
                                    :payment_detail_id => payment.id,
                                    :valid_from => Date.today,
                                    :validity => plan_detail.validity)

    new_plan.valid_to = Date.today + plan_detail.validity.to_i.days
    if client_plan != nil && client_plan.valid_to >= Date.today
      new_plan.ticket_count = plan_detail.ticket_limit.to_i + client_plan.ticket_count.to_i      
    else
      new_plan.ticket_count = plan_detail.ticket_limit      
    end
    new_plan.save
  end
  
  def txn_success_mail(txn_id)
    user_info = Transaction.where("txn_id = ?", txn_id).first
    payment_info = PaymentDetail.where("transaction_id = ?", txn_id).first
    PaymentMailer.success_email(user_info, payment_info).deliver_now
  end

  
end