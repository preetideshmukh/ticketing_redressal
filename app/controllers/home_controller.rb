class HomeController < ApplicationController  
  layout 'home_page'
  before_filter :check_configuration_status , :only => [:configuration]
  before_filter :check_first_transaction_status , :only => [:cem_play_number]
  skip_before_filter :configuration_status, :only => [:success, :company_code_generator, :create]

  def dashboard
    stats

    account = Settings['twitter']
   logger.info("======================#{account.inspect}")
    client= Twitter::REST::Client.new do |config|
     config.consumer_key = account['consumer_key']
     config.consumer_secret = account['consumer_secret']
     config.oauth_token = account['oauth_token']
     config.oauth_token_secret = account['oauth_token_secret']
    end
   
    @twitter_user = account['name']
   
    @tweet_news = client.user_timeline(@twitter_user, {count: 100})
  
  end

  def home_page
    render :layout => 'home'
  end

  def customer_response_message
    customer_care_details = params[:customer_care]
    @user = User.find(current_user)
    @user.update_attributes(:customer_care_number => customer_care_details[:customer_care_number], :customer_care_email => customer_care_details[:customer_care_email])
  end

  def payment
    @user = current_user
    @transaction=Transaction
    @paymentdetails = PaymentDetail.where("user_id = ?",@user.id)
    @ticket_status = UserPlanDetail.where("user_id = ?",@user.id).last    
    stats
  end

  def graph    
    stats
    @num = Ticket.where("created_at > ? and user_id=?", 15.days.ago,current_user.id).group("date(created_at)").count
  end

  def combine_forms
    render :layout => 'admin'
  end
  
  def show
    @txn_id = params[:id]
     respond_to do |format|
      format.pdf do
        pdf = ReportPdf.new(@txn_id, view_context)
        send_data pdf.render, filename: 'report.pdf', mime_type: 'application/pdf',disposition: :inline
      end
    end
  end

 def success
   render :layout => 'admin'
   @user = User.find_by(id: current_user.id)   
   @user.update_attributes(:configuration_status => true)   
 end

  def create
    @user_info = User.find_or_initialize_by(id: current_user.id)
    if @user_info.update_attributes(user_params)
      flash[:success] = "User updated"
      redirect_to plans_path
    else
      flash[:danger] = "Ticket not created"
      render('combine_forms')
    end
  end

  def company_code_generator
    temporary = params[:c_name] 
    initials = temporary.scan(/\b[a-z]/i).join.upcase
    @code = Home.random_string(initials)
    @code_data = @code.to_json
     respond_to do |format|
      format.json { render json: @code_data}
    end
  end

  def twitter_news
    account = Settings['twitter']
   
    Twitter.configure do |config|
     config.consumer_key = account['consumer_key']
     config.consumer_secret = account['consumer_secret']
     config.oauth_token = account['oauth_token']
     config.oauth_token_secret = account['oauth_token_secret']
    end
   
    @twitter_user = account['name']
   
    @tweet_news = Twitter.user_timeline(@twitter_user, {count: 3})
  end

  private  

  def stats
    @user=current_user.id
    @ticket_status = UserPlanDetail.where("user_id = ?",@user).last
    @ticket_resolved = Ticket.where('status = ? and user_id=?', "Resolved",current_user.id).count
    @ticket_processing = Ticket.where('status = ? and user_id =?', "Processing",current_user.id).count
    @ticket_new = Ticket.where('status = ? and user_id=?', "new",current_user.id).count
    @status = [ @ticket_resolved,@ticket_processing,@ticket_new]
    @per = Array.new
    @sum = @ticket_resolved+@ticket_processing+ @ticket_new
    @status.each do |x|
      @per << ((x.to_f/@sum)*100)
    end
  end

  def check_configuration_status
    if current_user.configuration_status != false
      redirect_to tickets_path
    end
  end
  
  def check_first_transaction_status
    user_transaction = Transaction.where("user_id = ?",current_user.id)
    if user_transaction.blank?
      redirect_to configuration_path
    end   
  end

  def user_params
    params.require(:user_info).permit(:company_name, :code_name, :customer_care_number, :customer_care_email)
  end
  
end