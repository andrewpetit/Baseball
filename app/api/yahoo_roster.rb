# frozen_string_literal: true

module Api
  class YahooRoster < YahooBase

    def initialize yahoo_access_token, league_key, team_id
      @league_key = league_key
      @team_id = team_id
      super yahoo_access_token
    end

    def current_roster_members
      data = parse_response(roster_url).xpath('//team/roster/players/player')
      return [] if data.empty?

      roster_members data
    end

    private

    def roster_url
      @roster_url ||= "#{BASE_URL}/team/#{@league_key}.t.#{@team_id}/roster/players"
    end
  end
end
