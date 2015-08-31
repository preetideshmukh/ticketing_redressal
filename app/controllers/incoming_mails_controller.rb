class IncomingMailsController < ApplicationController    
  require 'mail'
  skip_before_filter :verify_authenticity_token
skip_before_filter :authenticate_user!

  def create
    message = Mail.new(params[:message])

    puts "Before create, logs!"
    tic = Ticket.new    
    tic.crn = message.subject
    tic.description = message.body.decoded
     if tic.save
      puts "==========================created"
    end
        
    # Rails.logger.log Logger::INFO, message.subject #print the subject to the logs
    # Rails.logger.log Logger::INFO, message.body.decoded #print the decoded body to the logs

    # Do some other stuff with the mail message

    render :text => 'success', :status => 200 # a status of 404 would reject the mail
  end
  end