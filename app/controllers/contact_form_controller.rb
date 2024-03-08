class ContactFormController < ApplicationController
  def send_email
    ContactFormMailer.contact_email(params).deliver_now!
    ContactFormMailer.inform_user(params).deliver_now!

    respond_to do |format|
      format.json { render json: { response: 'success' } }
    end
  end
end
