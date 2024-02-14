class ContactFormMailer < ApplicationMailer
  default from: 'info@zen-os.com'

  def contact_email(params)
    @name = params[:name]
    @phone = params[:phone]
    @email = params[:email]
    @subject = params[:subject]
    @message = params[:message]

    mail(to: 'info@zen-os.com', subject: @subject)
  end
end
