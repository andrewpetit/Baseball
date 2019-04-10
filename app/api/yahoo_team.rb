# frozen_string_literal: true

module Api
  class YahooTeam < YahooBase
    AVAILABLE_LEAGUES_URL = "#{BASE_URL}/game/mlb/leagues;league_keys="

    def user_teams
      return [] if available_mlb_teams.empty? || available_leagues.empty?

      available_mlb_teams
        .map { |t| t.merge(available_leagues[t['league_key']]) }
        .map { |t| FantasyBaseballTeam.new(t) }
    end

    private

    def available_mlb_league_ids
      @available_mlb_league_ids = available_mlb_teams.map { |t| t['league_key'] }
    end

    def available_leagues
      @available_leagues ||= parse_response(AVAILABLE_LEAGUES_URL + available_mlb_league_ids.join(','))
                             .xpath("//game[game_key=#{current_mlb_id}]/leagues/league")
                             .map do |league|
        {
          league.xpath('league_key').text => {
            'league_name' => league.xpath('name').text
          }
        }
      end.inject(:merge)
    end
  end
end
