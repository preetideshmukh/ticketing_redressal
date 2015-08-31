class IncomingMailsController < ApplicationController    
  require 'mail'
  skip_before_filter :verify_authenticity_token
skip_before_filter :authenticate_user!

  def create
    puts "Entering the controller! Controlling the e-mail!"
    Rails.logger.info params[:headers][:subject]
    Rails.logger.info params[:plain]
    Rails.logger.info params[:html]
    
    # if User.all.map(&:email).include? params[:from] # check if user is registered
      @thought = Ticket.new
      @thought.body = params[:plain].split("\n").first
      @thought.user = User.where(:email => params[:from])
      @thought.date = DateTime.now

      if @thought.save
        render :text => 'Success', :status => 200
      else
        render :text => 'Internal failure', :status => 501
      end
    # else
      # render :text => 'Unknown user', :status => 404 # 404 would reject the mail
    # end
    
  end
end

