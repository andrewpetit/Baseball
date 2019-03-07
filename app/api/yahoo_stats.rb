module Api
  class YahooStats < YahooBase

    def initialize yahoo_access_token, mlb_id, league_key, player_keys
      @league_key = league_key
      @player_keys = player_keys.map { |p| p.gsub('mlb', mlb_id) }.join(',')
      super yahoo_access_token
    end

    def current_player_stats
      stats_url = "https://fantasysports.yahooapis.com/fantasy/v2/league/#{@league_key}/players;player_keys=#{@player_keys}/stats"
      data = parse_yahoo_response(stats_url)
      return [] if data.empty? || data['league'].first['players'].empty?

      data = data['league'].first['players'].first['player']
      data = remove_brackets data
      map_fields data
      data.map { |r| FantasyBaseballRosterMember.new(r) }
    end

    def map_fields data
      data.each do |r|
        r['first_name'] = r['name']['first'].first
        r['last_name'] = r['name']['last'].first
        r['external_id'] = r['player_id']
        r['eligible_positions'] = r['eligible_positions']['position'].join(',')
        r['headshot_url'] = r['headshot']['url'].first
        r['player_stats'] =
          r['player_stats']['stats'].first['stat']
                                    .map { |s| s.transform_values(&:first) } # remove brackets
                                    .reject { |s| s['stat_id'] == '60' } # it has HITS/AB's for some reason
                                    .map { |s| [s['stat_id'], s['value']] }.to_h
      end
    end

  end
end
