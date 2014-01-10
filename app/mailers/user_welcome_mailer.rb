class UserWelcomeMailer < ActionMailer::Base
  include Resque::Mailer 
  default from: 'patrick@nori.nu'

  def user_welcome(user)
    @subject = 'Welcome to Nori'
    to_email_address = "ptos382@gmail.com"
    
    mail( to: to_email_address, subject: @subject )
  end
end