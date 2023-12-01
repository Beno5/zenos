class ContactFormMailer < ApplicationMailer
  def contact_email(params)
    @name = params[:name]
    @phone = params[:phone]
    @email = params[:email]
    @subject = params[:subject]
    @message = params[:message]

    mail(to: 'benjamin.fejzagic@hotmail.com', subject: @subject)
  end
end
