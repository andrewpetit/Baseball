module Api
  class YahooBase
    require 'xmlsimple'
    MLB_ID_URL = 'https://fantasysports.yahooapis.com/fantasy/v2/game/mlb'.freeze

    def initialize yahoo_access_token
      @yahoo_access_token = yahoo_access_token
    end

    def current_mlb_id
      @current_mlb_id ||= parse_yahoo_response(MLB_ID_URL)['game'].first['game_id'].first
    end

    private

    def parse_yahoo_response request_url
      response = @yahoo_access_token.token.get(request_url)
      XmlSimple.xml_in(response.body)
    rescue StandardError => e
      error = "#{e.message}\n#{e.backtrace.inspect}"
      raise e unless Rails.env == 'production'
      ErrorMailer.new.error_email('Error response from yahoo', error).deliver!
      []
    end

    def post_and_parse_yahoo_response request_url, xml
      response = @yahoo_access_token.token.put(request_url, body: xml, headers: { 'Content-Type' => 'application/xml', 'Accept' => 'application/xml' })
      XmlSimple.xml_in(response.body)
    end
  end
end
