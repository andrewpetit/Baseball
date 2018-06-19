module Api
  class YahooTeam < YahooBase
    AVAILABLE_TEAMS_URL = 'https://fantasysports.yahooapis.com/fantasy/v2/users;use_login=1/games;is_available=1/teams'.freeze
    AVAILABLE_LEAGUES_URL = 'https://fantasysports.yahooapis.com/fantasy/v2/game/mlb/leagues;league_keys='.freeze

    def user_teams
      teams = available_teams
      return [] if teams.empty?
      league_ids = teams.map { |t| t['team_key'].first.split('.').slice(0, 3).join('.') }
      leagues = available_leagues(league_ids)
      return [] if leagues.empty?
      merged_teams = []
      teams.each do |team|
        leagues.each do |league|
          if team['team_key'].first.include? league['league_key'].first
            team['is_active'] = [team['is_game_over'] == ['0']]
            merged_teams << league.merge(team)
          end
        end
      end
      merged_teams = remove_brackets merged_teams
      merged_teams.map { |t| FantasyBaseballTeam.new(t) }
    end

    private

    def available_teams
      data = parse_yahoo_response(AVAILABLE_TEAMS_URL)
      return [] if data.empty?
      data = data['users'].first['user'].first['games'].first['game'].select { |g| g['game_id'].first == current_mlb_id }
      return [] if data.empty?
      game_data = data.first.except('teams')
      team_data = data.map { |t| t['teams'].first['team'] }.first.map { |t| t.except('managers') }
      team_data = team_data.reject { |t| t['type'].present? }
      team_data.each do |td|
        td['team_name'] = td['name']
        td['team_icon_url'] = td['team_logos'].first['team_logo'].first['url'] unless td['team_logos'].nil?
      end
      team_data.map { |td| game_data.merge(td) }
    end

    def available_leagues league_ids
      data = parse_yahoo_response(AVAILABLE_LEAGUES_URL + league_ids.join(','))
      return [] if data.empty?
      data = data['game'].select { |h| h['game_key'] == [current_mlb_id] }
      game_data = data.first.except('leagues')
      league_data = data.map { |l| l['leagues'].first['league'] }.first
      league_data.each { |ld| ld['league_name'] = ld['name'] }
      league_data.map { |ld| game_data.merge(ld) }
    end

  end
end
