class ContactFormController < ApplicationController
  def send_email
    ContactFormMailer.contact_email(params).deliver_now!
    ContactFormMailer.inform_user(params).deliver_now!

    respond_to do |format|
      format.json { render json: { response: 'success' } }
    end
  end

  def send_email_landing
    ContactFormMailer.email_landing(params).deliver_now!

    respond_to do |format|
      format.json { render json: { response: 'success' } }
    end
  end

  def send_academy_email
    begin
      ContactFormMailer.academy_registration(params).deliver_now!
      flash[:notice] = t('talent_management.pricing.form.success')
    rescue StandardError
      flash[:alert] = t('talent_management.pricing.form.not_success')
    end

    redirect_back fallback_location: root_path
  end
end
