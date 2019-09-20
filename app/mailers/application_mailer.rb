class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def email_list(params)
    @params = params

    opts = {
      subject: 'Email List',
      from: 'no-reply@badmagnets.com',
      to: 'admin@badmagnets.com'
    }

    mail opts
  end

  def contact(params)
    @params = params

    opts = {
      subject: 'Contact',
      from: @params[:email],
      to: 'admin@badmagnets.com'
    }

    mail opts
  end
end
