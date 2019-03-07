module Api
  class YahooRanks < YahooBase

    def initialize yahoo_access_token, mlb_id, league_key, player_keys
      @league_key = league_key
      @player_keys = player_keys.map { |p| p.gsub('mlb', mlb_id) }.join(',')
      super yahoo_access_token
    end

    def current_player_ranks
      ranks_url = "https://fantasysports.yahooapis.com/fantasy/v2/league/#{@league_key}/players;player_keys=#{@player_keys}/ranks"
      data = parse_yahoo_response(ranks_url)
      return [] if data.empty? || data['league'].first['players'].empty?

      data = data['league'].first['players'].first['player']
      data = remove_brackets data
      map_fields data
      data.map { |r| FantasyBaseballRosterMember.new(r) }
    end

    private

    def map_fields data
      data.each do |r|
        r['first_name'] = r['name']['first'].first
        r['last_name'] = r['name']['last'].first
        r['external_id'] = r['player_id']
        r['eligible_positions'] = r['eligible_positions']['position'].join(',')
        r['headshot_url'] = r['headshot']['url'].first
        r['player_ranks'] = r['player_ranks'].values.first
      end
    end

  end
end
