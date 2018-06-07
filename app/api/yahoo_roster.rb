module Api
  class YahooRoster < YahooBase

    def initialize yahoo_access_token, league_key, team_id
      @league_key = league_key
      @team_id = team_id
      super yahoo_access_token
    end

    def current_roster_members
      roster_url = "https://fantasysports.yahooapis.com/fantasy/v2/team/#{@league_key}.t.#{@team_id}/roster/players"
      data = parse_yahoo_response(roster_url)
      return [] if team_missing? data
      data = data['team'].first['roster'].first['players'].first['player']
      data = remove_brackets data
      map_fields data
      data.map { |r| FantasyBaseballRosterMember.new(r) }
    end

    private

    def team_missing? data
      data.empty? ||
        data['team'].first['roster'].empty? ||
        data['team'].first['roster'].first['players'].first.empty?
    end

    def map_fields data
      data.each do |r|
        r['first_name'] = r['name']['first'].first
        r['last_name'] = r['name']['last'].first
        r['external_id'] = r['player_id']
        r['eligible_positions'] = r['eligible_positions']['position'].join(',')
        r['selected_position'] = r['selected_position']['position'].first
        r['headshot_url'] = r['headshot']['url'].first
      end
    end
  end
end
