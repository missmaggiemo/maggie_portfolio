class MyMailer < ActionMailer::Base
  default from: "messages@missmaggiemo.com"
  default to: "maggie@missmaggiemo.com"
  
  def visitor_email(message)
    @content = message[:content]
    @email = message[:email]
    @name = message[:name]
    mail(subject: "Email from #{@name}!")
  end

end
