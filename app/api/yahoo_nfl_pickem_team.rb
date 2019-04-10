# frozen_string_literal: true

module Api
  class YahooNflPickemTeam < YahooBase
    AVAILABLE_LEAGUES_URL = "#{BASE_URL}/game/nflp/leagues;league_keys="

    def user_teams
      return [] if available_nfl_pickem_teams.empty? || available_leagues.empty?

      available_mlb_teams
        .map { |t| t.merge(available_leagues[t['league_key']]) }
        .map { |t| FantasyBaseballTeam.new(t) }
    end

    private

    def available_nfl_pickem_league_ids
      @available_nfl_pickem_league_ids = available_nfl_pickem_teams.map { |t| t['league_key'] }
    end

    def available_leagues
      @available_leagues ||= parse_response(AVAILABLE_LEAGUES_URL + available_nfl_pickem_league_ids.join(','))
                             .xpath("//game[game_key=#{current_nfl_pickem_id}]/leagues/league")
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
