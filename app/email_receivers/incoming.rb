class EmailToSmsReceiver < Incoming::Strategies::Postmark
  def receive(mail)
    #send_sms([mail.subject, mail.body].join(": "))
  	puts "IN TO THE EmailToSmsReceiver"
  end
  private
    def send_sms(message)
      # Insert twilio magic here
    end
end