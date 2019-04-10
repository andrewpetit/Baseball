# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ErrorMailer, type: :mailer do
  let(:subject_text) { junk }
  let(:text) { junk }
  let(:error_mailer) { described_class.new }

  let(:params) do
    {
      to: Rails.application.secrets.email,
      subject: subject_text,
      template_path: 'error_mailer',
      template_name: 'error_email'
    }
  end

  before do
    allow(error_mailer).to receive(:mail)
  end

  describe '#error_email' do
    it 'sends error email' do
      error_mailer.error_email(subject_text, text)
      expect(error_mailer).to have_received(:mail).with(params)
    end
  end
end
