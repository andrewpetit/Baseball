require 'rails_helper'

describe Devise::RegistrationsController do
  include_context 'devise_testing_setup'

  describe 'new' do
    it 'shows the form to register' do
      get :new, params: {}
      expect(response).to render_template(:new)
    end
  end

  describe 'edit' do
    it 'shows the form edit registration information' do
      sign_in user
      get :edit, params: { client_key: junk }
      expect(response).to render_template(:edit)
    end
  end
end
