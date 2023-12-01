class ContactFormController < ApplicationController
  def send_email
    ContactFormMailer.contact_email(params).deliver_now!

   # if send_contact_email(params)
  #    flash[:success] = 'Your message has been sent successfully.'
   # else
   #   flash[:error] = 'There was an error sending your message.'
  #  end
  end
end
