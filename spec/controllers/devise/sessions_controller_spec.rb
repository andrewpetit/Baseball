require 'rails_helper'

describe Devise::SessionsController do
  include_context 'devise_testing_setup'

  describe 'new' do
    it 'shows the sign_in form' do
      get :new, params: {}
      expect(response).to render_template(:new)
    end
  end
end
