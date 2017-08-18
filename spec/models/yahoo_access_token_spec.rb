require 'rails_helper'

RSpec.describe YahooAccessToken, type: :model do
  let(:yahoo_access_token) { build :yahoo_access_token, user: user }

  let(:user) { create :user }
  let(:code_value) { junk }
  let(:token) { instance_double('token') }
  let(:oauth_client) { instance_double 'oauth_client' }
  let(:auth_code) { instance_double 'client_auth_code' }
  let(:token_hash) { junk }
  let(:expired) { false }

  describe '#access_token_set' do
    before do
      allow(YahooAccessToken).to receive(:oauth_client).and_return(oauth_client)
      allow(oauth_client).to receive(:auth_code).and_return(auth_code)
      allow(auth_code).to receive(:get_token).and_return(token)
      allow(token).to receive(:to_hash).and_return(token_hash)
    end
    it 'saves an access token' do
      expect do
        yahoo_access_token.access_token_set code_value
      end.to change(YahooAccessToken, :count).by(1)
    end
  end

  describe '#token' do
    before do
      allow(yahoo_access_token).to receive(:save)
      allow(token).to receive(:refresh!).and_return(token)
      allow(token).to receive(:expired?).and_return(expired)
      allow(OAuth2::AccessToken).to receive(:from_hash).and_return(token)
      allow(token).to receive(:to_hash).and_return(token_hash)
      yahoo_access_token.token
    end
    context 'with valid token' do
      it 'is not refreshed' do
        expect(token).not_to have_received(:refresh!)
        expect(yahoo_access_token).not_to have_received(:save)
      end
    end

    context 'with invalid token' do
      let(:expired) { true }

      it 'is refreshed' do
        expect(token).to have_received(:refresh!)
        expect(yahoo_access_token).to have_received(:save)
      end
    end
  end
end
