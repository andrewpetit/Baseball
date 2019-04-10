# frozen_string_literal: true

class ErrorMailer < ApplicationMailer
  def error_email subject, text
    @text = text
    mail(to: Rails.application.secrets.email,
         subject: subject,
         template_path: 'error_mailer',
         template_name: 'error_email')
  end
end
