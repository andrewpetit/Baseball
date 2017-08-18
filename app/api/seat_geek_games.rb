module Api
  class SeatGeekGames
    CLIENT_ID = ENV['SEAT_GEEK_CLIENT_ID']
    TEAM_IDS = Array(1..30).freeze

    def todays_games
      start_date = Time.now.strftime('%F')
      end_date = (Time.now + (60 * 60 * 24)).strftime('%F')
      get_games(start_date, end_date)
    end

    def get_games start_date, end_date
      base_url = 'https://api.seatgeek.com/2/events?per_page=50&performers.id='.freeze
      url = "#{base_url}#{TEAM_IDS.join(',')}&datetime_utc.gte=#{start_date}&datetime_local.lte=#{end_date}&client_id=#{CLIENT_ID}"
      parse_response(get_response(url))
    end

    private

    def get_response url
      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      request = Net::HTTP::Get.new(uri.request_uri)
      http.request(request)
    end

    def parse_response response
      return [] unless response.message == 'OK'
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
