class UserMailer < ApplicationMailer
  default from: 'anoopzakasboy@gmail.com'

	 def ticket_complaint_email(ticket)
	   @ticket = ticket   
	   @url  = 'http://example.com/login'   
	   mail(to: @ticket.forwarded_to, subject: 'Customer Complaint')
	 end

	 def receive(email)
	 logger.info("Got an email from: #{email.from}") 
	 	
     logger.info("Email to: #{email.to}") 

     logger.info("Got an email about: #{email.subject}") 

     end


end
