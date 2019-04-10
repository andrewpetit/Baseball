# frozen_string_literal: true

module Api
  class YahooStats < YahooBase

    def initialize yahoo_access_token, mlb_id, league_key, player_keys
      @league_key = league_key
      @player_keys = player_keys.map { |p| p.gsub('mlb', mlb_id) }.join(',')
      super yahoo_access_token
    end

    def current_player_stats
      stats_url = "#{BASE_URL}/league/#{@league_key}/players;player_keys=#{@player_keys}/stats"
      data = parse_response(stats_url).xpath('//league/players/player')
      return [] if data.empty?

      roster_members data
    end
  end
end
