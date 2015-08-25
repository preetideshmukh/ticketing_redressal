class PlanSubscriptionsController < ApplicationController
  layout 'admin'
  skip_before_filter :configuration_status  
  def plan_summary
    if !current_user.firstname.blank? && !current_user.lastname.blank?
      @client_detail = User.find(plan_params[:user_id])
      @plan_info = Plan.find(plan_params[:plan_id])
      @total_price = PaymentInformation.new.calculate_tax(@plan_info.base_amount, @plan_info.service_tax)
    else
      flash[:danger] = t'plan_subscriptions.editprofile'
      redirect_to edit_user_registration_path
    end
  end

  def transaction_hashchecksum_detail
    transaction_id = PaymentInformation.new.unique_transaction_id 
    txn_status = Transaction.new(client_plan_params)   
    txn_status.hash_val = PaymentInformation.new.request_checksum(transaction_id, client_plan_params)
    txn_status.txn_id = transaction_id
    txn_status.client_id = User.find(client_plan_params[:user_id])
    txn_status.save
    redirect_to payment_confirmation_plan_subscriptions_path(:user_id => client_plan_params[:user_id])
  end

  def payment_confirmation
    @pay_info = Transaction.where("user_id = ?", params[:user_id]).last
  end

  def payment_response
    payment_response = params    
    user_checksum = PaymentInformation.new.response_checksum(payment_response[:txnid], payment_response[:status])
    if payment_response[:status] == "failure"
      flash[:danger] = t 'plan_subscriptions.create_fail'
      redirect_to plans_path
    elsif payment_response[:status] == "success"
         
      if user_checksum == payment_response[:hash]
        checksum = true
      else
        checksum = false
      end
      flash[:success] = t 'plan_subscriptions.create_success'

      if current_user.configuration_status == false
       redirect_to "/success"
      else
        redirect_to tickets_path
      end
      PaymentInformation.new.store_payment_details(payment_response, checksum)
    end
    
  end
  
  
  private
  
    def plan_params
      params.require(:plan).permit(:user_id, :plan_id)
    end
    def client_plan_params
      params.require(:client_plan).permit(:client_name, :email, :mobile_no, :total_amount, :plan_name, :plan_id, :user_id)
    end

    protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
  
end
