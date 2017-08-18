class ErrorMailer < ApplicationMailer
  def error_email subject, text
    @text = text
    mail(to: ENV['EMAIL'],
         subject: subject,
         template_path: 'error_mailer',
         template_name: 'error_email')
  end
end
