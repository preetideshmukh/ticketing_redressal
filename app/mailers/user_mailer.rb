class UserMailer < ApplicationMailer
  default from: 'anoopzakasboy@gmail.com'

	 def ticket_complaint_email(ticket)
	   @ticket = ticket   
	   @url  = 'http://example.com/login'   
	   mail(to: @ticket.forwarded_to, subject: 'Customer Complaint')
	 end
end
