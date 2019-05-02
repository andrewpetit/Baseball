# frozen_string_literal: true

module Api
  class SeatGeekGames
    CLIENT_ID = Rails.application.secrets.seat_geek_client_id
    TEAM_IDS = Array(1..30).freeze
    BASE_URL = 'https://api.seatgeek.com/2/events?per_page=50&performers.id='

    def todays_games
      get_games(today_start, today_end)
    end

    def get_games start_date, end_date
      parse_response(get_response(url(start_date, end_date)))
    end

    private

    def today_start
      Time.now
    end

    def today_end
      (Time.now + (60 * 60 * 24))
    end

    def url start_date, end_date
      "#{BASE_URL}#{TEAM_IDS.join(',')}"\
      "&datetime_utc.gte=#{start_date.strftime('%F')}"\
      "&datetime_local.lte=#{end_date.strftime('%F')}"\
      "&client_id=#{CLIENT_ID}"
    end

    def get_response url
      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      request = Net::HTTP::Get.new(uri.request_uri)
      http.request(request)
    end

    def parse_response response
      return [] unless response.code == '200'

      json = JSON.parse(response.body)
      return [] unless json['events'].any?

      games = json['events'].flat_map { |e| e['performers'] }
      games = games.map do |p|
        {
          team: p['name'],
          home: p['home_team'],
          away: p['away_team']
        }
      end
      games = games.select { |t| t[:home] || t[:away] }
      games.uniq { |t| t[:team] } # dont worry about double headers for now
    end
  end
end
