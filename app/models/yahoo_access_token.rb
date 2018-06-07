class YahooAccessToken < ApplicationRecord
  require 'oauth2'
  belongs_to :user

  USER_AUTH_URL = 'https://api.login.yahoo.com/oauth2/request_auth'.freeze
  AUTHORIZE_URL = '/oauth2/request_auth'.freeze
  TOKEN_URL = '/oauth2/get_token'.freeze
  CLIENT_KEY = ENV['YAHOO_CLIENT_KEY'].freeze
  CLIENT_SECRET = ENV['YAHOO_CLIENT_SECRET'].freeze

  def access_token_set code_value
    new_token = YahooAccessToken.oauth_client.auth_code.get_token(code_value, redirect_uri: 'oob')
    self.access_token = new_token.to_hash
    save
  end

  def self.auth_url redirect_uri
    redirect_uri = Rails.env == 'production' ? redirect_uri : 'oob'
    oauth_client.auth_code.authorize_url(redirect_uri: redirect_uri)
  end

  def self.oauth_client
    OAuth2::Client.new(CLIENT_KEY, CLIENT_SECRET, site: USER_AUTH_URL, authorize_url: AUTHORIZE_URL, token_url: TOKEN_URL)
  end

  def token
    token = OAuth2::AccessToken.from_hash(YahooAccessToken.oauth_client, parsed_access_token)
    if token.expired?
      token = token.refresh!
      self.access_token = token.to_hash
      save
    end
    token
  end

  private

  def parsed_access_token
    JSON.parse(access_token.gsub(/:(\w+)/) { "\"#{Regexp.last_match(1)}\"" }.gsub('=>', ':')).symbolize_keys
  end
end
