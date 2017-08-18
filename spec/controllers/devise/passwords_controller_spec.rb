require 'rails_helper'

describe Devise::PasswordsController do
  include_context 'devise_testing_setup'

  describe 'new' do
    it 'shows the form to send the password reset email' do
      get :new, params: {}
      expect(response).to render_template(:new)
    end
  end

  describe 'edit' do
    it 'shows the form to change the password' do
      get :edit, params: { reset_password_token: 'derp' }
      expect(response).to render_template(:edit)
    end
  end
end
