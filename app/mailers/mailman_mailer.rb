class Mailman < ActionMailer::Base

  def receive(email)
	 logger.info("Got an email from: #{email.from}") 
	 	
     logger.info("Email to: #{email.to}") 

     logger.info("Got an email about: #{email.subject}")

  end

end