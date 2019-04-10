# frozen_string_literal: true

module Api
  class YahooBase
    # find more games
    # https://fantasysports.yahooapis.com/fantasy/v2/games;is_available=1
    BASE_URL = 'https://fantasysports.yahooapis.com/fantasy/v2'
    MLB_ID_URL = "#{BASE_URL}/game/mlb"
    NFL_PICKEM_ID_URL = "#{BASE_URL}/game/nflp"
    AVAILABLE_TEAMS_URL = "#{BASE_URL}/users;use_login=1/games;is_available=1/teams"

    def initialize yahoo_access_token
      @yahoo_access_token = yahoo_access_token
    end

    def current_mlb_id
      @current_mlb_id ||= parse_response(MLB_ID_URL).xpath('//game/game_id').text
    end

    def current_nfl_pickem_id
      @current_nfl_pickem_id ||= parse_response(NFL_PICKEM_ID_URL).xpath('//game/game_id').text
    end

    def available_mlb_teams
      @available_mlb_teams ||= available_teams(current_mlb_id)
    end

    def available_nfl_pickem_teams
      @available_nfl_pickem_teams ||= available_teams(current_nfl_pickem_id)
    end

    private

    # rubocop:disable Metrics/AbcSize
    def available_teams game_id
      game = parse_response(AVAILABLE_TEAMS_URL)
             .xpath("//game[game_key=#{game_id}]")

      game.xpath('teams/team')
          .select { |team| team.xpath('type').empty? }
          .map do |team|
        full_key = team.xpath('team_key').text
        {
          'league_key' => full_key.split('.').slice(0, 3).join('.'),
          'league_id' => full_key.split('.')[2],
          'team_id' => team.xpath('team_id').text,
          'team_name' => team.xpath('name').text,
          'team_icon_url' => team.xpath('team_logos/team_logo/url').text,
          'is_active' => game.xpath('is_game_over').text == '0'
        }
      end
    end
    # rubocop:enable Metrics/AbcSize

    def remove_brackets data
      data.map { |r| r.transform_values(&:first) } # remove brackets/yahoo returns arrays
    end

    def parse_response request_url
      Nokogiri::XML(raw_response(request_url)).remove_namespaces!
    rescue StandardError => e
      error = "#{e.message}\n#{e.backtrace.inspect}"
      raise e unless Rails.env == 'production'

      ErrorMailer.new.error_email('Error parsing response from yahoo', error).deliver!
      []
    end

    def raw_response request_url
      @yahoo_access_token.get(request_url).body
    end

    def post_and_parse_response request_url, xml
      response = Nokogiri::XML(raw_put(request_url, xml)).remove_namespaces!
      response.xpath('//status').first.text == 'success'
    rescue StandardError => e
      error = "#{e.message}\n#{e.backtrace.inspect}"
      raise e unless Rails.env == 'production'

      ErrorMailer.new.error_email('Error parsing response from yahoo', error).deliver!
      false
    end

    def raw_put request_url, xml
      @yahoo_access_token.token.put(request_url, body: xml, headers: { 'Content-Type' => 'application/xml', 'Accept' => 'application/xml' }).body
    end

    def roster_members nokogiri_data
      nokogiri_data.map do |player|
        FantasyBaseballRosterMember.new(map_roster_properties(player))
      end
    end

    # rubocop:disable Metrics/AbcSize
    def map_roster_properties player
      {
        headshot_url: player.xpath('headshot/url').text,
        image_url: player.xpath('image_url').text,
        first_name: player.xpath('name/first').text,
        last_name: player.xpath('name/last').text,
        external_id: player.xpath('player_id').text,
        eligible_positions: player.xpath('eligible_positions/position').map(&:text).join(','),
        selected_position: player.xpath('selected_position/position').text,
        display_position: player.xpath('display_position').text,
        uniform_number: player.xpath('uniform_number').text,
        position_type: player.xpath('position_type').text,
        is_undroppable: player.xpath('is_undroppable').text,
        editorial_player_key: player.xpath('editorial_player_key').text,
        editorial_team_key: player.xpath('editorial_team_key').text,
        editorial_team_full_name: player.xpath('editorial_team_full_name').text,
        editorial_team_abbr: player.xpath('editorial_team_abbr').text,
        updated_position: player.xpath('updated_position').text,
        status_full: player.xpath('status_full').text,
        probable_starter: player.xpath('starting_status/is_starting').text == '1',
        season_rank: (begin
                        Integer(player.xpath('player_ranks/player_rank/rank_type[contains(text(),"S")]/../rank_value').text)
                      rescue StandardError
                        nil
                      end),
        original_rank: (begin
                          Integer(player.xpath('player_ranks/player_rank/rank_type[contains(text(),"OR")]/../rank_value').text)
                        rescue StandardError
                          nil
                        end),
        player_stats: Hash[player.xpath('player_stats/stats/stat').map { |x| [x.xpath('stat_id').text, x.xpath('value').text] }]
      }
    end
    # rubocop:enable Metrics/AbcSize
  end
end
