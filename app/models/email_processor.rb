class EmailProcessor
  def self.process(email)
    Postemail.create!({ body: email.body, email: email.from })
  end
end