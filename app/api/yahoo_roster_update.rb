require 'nokogiri'

module Api
  class YahooRosterUpdate < YahooBase

    def initialize fantasy_baseball_team, yahoo_access_token
      @fantasy_baseball_team = fantasy_baseball_team
      super yahoo_access_token
    end

    def update_xml
      @update_xml ||= serialize.to_xml
    end

    def update_roster update_type
      update_url = "https://fantasysports.yahooapis.com/fantasy/v2/team/#{@fantasy_baseball_team.league_key}.t.#{@fantasy_baseball_team.team_id}/roster"
      post_and_parse_yahoo_response(update_url, update_xml)

      roster = FantasyBaseballRoster.create(roster_sort: @fantasy_baseball_team.roster_sort, update_type: update_type)
      roster.fantasy_baseball_roster_member = @fantasy_baseball_roster
      @fantasy_baseball_team.fantasy_baseball_roster.push(roster)
    end

    private

    def fantasy_baseball_roster
      @fantasy_baseball_roster ||= @fantasy_baseball_team.sorted_roster
    end

    def serialize
      Nokogiri::XML::Builder.new(encoding: 'UTF-8') do |xml|
        xml.fantasy_content do
          xml.roster do
            xml.coverage_type 'date'
            xml.date Time.now.strftime('%F')
            xml.players do
              fantasy_baseball_roster.each do |p|
                xml.player do
                  xml.player_key p.editorial_player_key
                  xml.position p.updated_position
                end
              end
            end
          end
        end
      end
    end

  end
end
