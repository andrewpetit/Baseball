# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  around_action :handle_exceptions

  private

  def handle_exceptions
    yield
  rescue StandardError => e
    raise e unless Rails.env == 'production'

    error = "#{e.message}\n#{e.backtrace.inspect}"
    ErrorMailer.new.error_email('Error', error).deliver!
  end
end
