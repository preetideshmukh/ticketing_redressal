class IncomingMailsController < ApplicationController    
  require 'mail'
  skip_before_filter :verify_authenticity_token
skip_before_filter :authenticate_user!

  def create
    puts "Entering the controller! Controlling the e-mail!"
    Rails.logger.info params[:headers][:subject]
    Rails.logger.info params[:plain]
    Rails.logger.info params[:html]
    
    @ticket = Ticket.new
    @ticket.description = params[:plain].split("\n").first
    @ticket.participant_email = params[:from]
    @ticket.created_at = DateTime.now

    if @ticket.save
      render :text => 'Success', :status => 200
    else
      render :text => 'Internal failure', :status => 501
    end       
  end
end

