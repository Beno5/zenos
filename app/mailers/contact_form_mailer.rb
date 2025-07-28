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

  def inform_user(params)
    @email = params[:email]
    @content = I18n.t('mail.content')

    mail(to: @email, subject: I18n.t('mail.subject'))
  end

  def email_landing(params)
    @name = params[:name]
    @company = params[:company_name]
    @email = params[:email]
    @subject = 'Test sa landing page zeps'

    mail(to: 'info@zen-os.com', subject: @subject)
  end

  def academy_registration(params)
    @type = params[:type]
    @title = params[:title]
    @data = params

    mail(to: 'ema@zen-os.com', subject: "Nova prijava: #{@title}")
  end
end
