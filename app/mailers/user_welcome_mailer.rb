class UserWelcomeMailer < ActionMailer::Base
  include Resque::Mailer 
  default from: 'patrick@nori.nu'

  def user_welcome(user)
    @subject = 'Welcome to Nori'
    begin
      Rails.logger.debug "Preparing to send email..." if Rails.logger.debug?
      to_email_address = "ptos382@gmail.com"
      retval = mail( to: to_email_address, subject: @subject )
    
    rescue Exception
      Rails.logger.warn "Unable to send email: #{e}" if Rails.logger.warn?
      raise e
    end
    
    Rails.logger.debug "Returning #{retval}" if Rails.logger.debug?

    retval

  end
end