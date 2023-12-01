class ContactFormController < ApplicationController
  def send_email
    name = params[:name]
    phone = params[:phone]
    email = params[:email]
    subject = params[:subject]
    message = params[:message]

    if send_contact_email(name, phone, email, subject, message)
      flash[:success] = 'Your message has been sent successfully.'
    else
      flash[:error] = 'There was an error sending your message.'
    end
  end

  private

  def send_contact_email(name, phone, email, subject, message)
    # Implement email sending logic using a mailer
    # Adjust this code according to your mailer setup and configuration

    begin
      ContactFormMailer.with(name: name, phone: phone, email: email, subject: subject, message: message).contact_email.deliver_now
      return true
    rescue StandardError => e
      Rails.logger.error("Error sending contact email: #{e.message}")
      return false
    end
  end
end
