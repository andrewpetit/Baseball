# frozen_string_literal: true

RSpec.shared_context 'yahoo_base_response_stubs' do
  let(:current_mlb_id) { '268' }
  let(:league_ids) { ['370.l.85254', '370.l.85255'] }

  let(:valid_team1) do
    build :fantasy_baseball_team,
          league_key: '268.l.78659',
          league_id: '85254',
          team_id: '9',
          roster_sort_id: nil,
          team_name: 'Titty City',
          league_name: 'Redlegs Invitational',
          is_active: nil,
          auto_update: nil,
          team_icon_url: 'https://s.yimg.com/dh/ap/fantasy/img/mlb/icon_3_lg.gif'
  end

  let(:valid_team2) do
    build :fantasy_baseball_team,
          league_key: '268.l.57939',
          league_id: '85255',
          team_id: '9',
          roster_sort_id: nil,
          team_name: 'Titty City',
          league_name: 'Redlegs Invitational',
          is_active: nil,
          auto_update: nil,
          team_icon_url: 'https://s.yimg.com/dh/ap/fantasy/img/mlb/icon_3_lg.gif'
  end

  let(:valid_user_teams) do
    [valid_team1, valid_team2]
  end

  let(:valid_mlb_id_response) do
    "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
    <fantasy_content xml:lang=\"en-US\" yahoo:uri=\"http://fantasysports.yahooapis.com/fantasy/v2/game/mlb\" time=\"52.129030227661ms\" copyright=\"Data provided by Yahoo! and STATS, LLC\" refresh_rate=\"60\" xmlns:yahoo=\"http://www.yahooapis.com/v1/base.rng\" xmlns=\"http://fantasysports.yahooapis.com/fantasy/v2/base.rng\">
  <game>
    <game_key>#{current_mlb_id}</game_key>
    <game_id>#{current_mlb_id}</game_id>
    <name>Baseball</name>
    <code>mlb</code>
    <type>full</type>
    <url>https://baseball.fantasysports.yahoo.com/b1</url>
    <season>2019</season>
    <is_registration_over>0</is_registration_over>
    <is_game_over>0</is_game_over>
    <is_offseason>0</is_offseason>
  </game>
</fantasy_content>
<!-- fanos2061.sports.bf1.yahoo.com Fri Feb  1 17:23:31 UTC 2019 -->"
  end

  let(:current_nfl_pickem_id) { '381' }
  let(:valid_nfl_pickem_id_response) do
    "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
    <fantasy_content xml:lang=\"en-US\" yahoo:uri=\"http://fantasysports.yahooapis.com/fantasy/v2/game/nflp\" time=\"27.169942855835ms\" copyright=\"Data provided by Yahoo! and STATS, LLC\" refresh_rate=\"60\" xmlns:yahoo=\"http://www.yahooapis.com/v1/base.rng\" xmlns=\"http://fantasysports.yahooapis.com/fantasy/v2/base.rng\">
      <game>
        <game_key>#{current_nfl_pickem_id}</game_key>
        <game_id>#{current_nfl_pickem_id}</game_id>
        <name>Pro Football Pick'em</name>
        <code>nflp</code>
        <type>pickem-group</type>
        <url>https://football.fantasysports.yahoo.com/pickem</url>
        <season>2018</season>
        <is_registration_over>0</is_registration_over>
        <is_game_over>0</is_game_over>
        <is_offseason>0</is_offseason>
        <current_week>21</current_week>
      </game>
    </fantasy_content>
    <!-- fanos291.sports.bf1.yahoo.com Fri Feb  1 19:26:38 UTC 2019 -->"
  end

  let(:mlb_team) do
    [{ 'league_id' => '78659',
       'league_key' => '268.l.78659',
       'team_icon_url' => 'https://s.yimg.com/dh/ap/fantasy/img/profile_96.png',
       'team_id' => '6',
       'team_name' => 'Troy Tulowtitski',
       'is_active' => true },
     { 'league_id' => '57939',
       'league_key' => '268.l.57939',
       'team_icon_url' => 'https://s.yimg.com/dh/ap/fantasy/img/profile_96.png',
       'team_id' => '3',
       'team_name' => 'Team Andy',
       'is_active' => true }]
  end

  let(:pickem_team) do
    [{ 'league_id' => '544',
       'league_key' => '381.g.544',
       'team_icon_url' => '',
       'team_id' => '19',
       'team_name' => 'Andrew Petit',
       'is_active' => true }]
  end

  let(:teams_count) { '2' }

  let(:unstarted_team) do
    "<team>
              <team_key>268.l.auto.t.3</team_key>
              <team_id>3</team_id>
              <name>Team Andy</name>
              <type>auto</type>
            </team>
          </teams>"
  end
  let(:team) { [team1, team2] }

  let(:games_count) { 2 }

  let(:valid_teams_response) do
    "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
    <fantasy_content xml:lang=\"en-US\" yahoo:uri=\"http://fantasysports.yahooapis.com/fantasy/v2/users;use_login=1/games;is_available=1/teams\" time=\"122.09510803223ms\" copyright=\"Data provided by Yahoo! and STATS, LLC\" refresh_rate=\"60\" xmlns:yahoo=\"http://www.yahooapis.com/v1/base.rng\" xmlns=\"http://fantasysports.yahooapis.com/fantasy/v2/base.rng\">
      <users count=\"1\">
        <user>
          <guid>OFWR6UB5YDFVEZDE3YL3B7IGV4</guid>
          <games count=\"#{games_count}\">
            #{game}
          </games>
        </user>
      </users>
    </fantasy_content>
    <!-- fanos1907.sports.bf1.yahoo.com Fri Feb  1 20:50:03 UTC 2019 -->"
  end

  let(:game) do
    "<game>
      <game_key>#{current_mlb_id}</game_key>
      <game_id>#{current_mlb_id}</game_id>
      <name>Football</name>
      <code>nfl</code>
      <type>full</type>
      <url>https://football.fantasysports.yahoo.com/f1</url>
      <season>2018</season>
      <is_registration_over>1</is_registration_over>
      <is_game_over>0</is_game_over>
      <is_offseason>0</is_offseason>
          <teams count=\"#{teams_count}\">
          #{team}
      </game>
    <game>
      <game_key>#{current_nfl_pickem_id}</game_key>
      <game_id>#{current_nfl_pickem_id}</game_id>
      <name>Pro Football Pick'em</name>
      <code>nflp</code>
      <type>pickem-group</type>
      <url>https://football.fantasysports.yahoo.com/pickem</url>
      <season>2018</season>
      <is_registration_over>0</is_registration_over>
      <is_game_over>0</is_game_over>
      <is_offseason>0</is_offseason>
      <current_week>21</current_week>
      <teams count=\"1\">
        <team>
          <team_key>381.g.544.t.19</team_key>
          <team_id>19</team_id>
          <name>Andrew Petit</name>
          <is_owned_by_current_login>1</is_owned_by_current_login>
          <url>https://football.fantasysports.yahoo.com/pickem/544/19</url>
          <points>159</points>
          <wins>159</wins>
          <losses>95</losses>
          <can_edit_current_week>1</can_edit_current_week>
          <rank>9</rank>
        </team>
      </teams>
    </game>"
  end

  let(:team1) do
    "<team>
      <team_key>268.l.78659.t.6</team_key>
      <team_id>6</team_id>
      <name>Troy Tulowtitski</name>
      <is_owned_by_current_login>1</is_owned_by_current_login>
      <url>https://baseball.fantasysports.yahoo.com/archive/mlb/2012/78659/6</url>
      <team_logos>
        <team_logo>
          <size>large</size>
          <url>https://s.yimg.com/dh/ap/fantasy/img/profile_96.png</url>
        </team_logo>
      </team_logos>
      <division_id>2</division_id>
      <number_of_moves>16</number_of_moves>
      <number_of_trades>0</number_of_trades>
      <roster_adds>
        <coverage_type>week</coverage_type>
        <coverage_value>25</coverage_value>
        <value>0</value>
      </roster_adds>
      <clinched_playoffs>1</clinched_playoffs>
      <league_scoring_type>head</league_scoring_type>
      <draft_position>9</draft_position>
      <has_draft_grade>0</has_draft_grade>
      <managers>
        <manager>
          <manager_id>6</manager_id>
          <nickname>Andrew</nickname>
          <guid>OFWR6UB5YDFVEZDE3YL3B7IGV4</guid>
          <is_current_login>1</is_current_login>
          <email>petit.13@osu.edu</email>
          <image_url>https://ct.yimg.com/cy/1768/39361574426_98028a_64sq.jpg</image_url>
        </manager>
      </managers>
    </team>"
  end

  let(:team2) do
    "<team>
      <team_key>268.l.57939.t.3</team_key>
      <team_id>3</team_id>
      <name>Team Andy</name>
      <is_owned_by_current_login>1</is_owned_by_current_login>
      <url>https://baseball.fantasysports.yahoo.com/archive/mlb/2012/57939/3</url>
      <team_logos>
        <team_logo>
          <size>large</size>
          <url>https://s.yimg.com/dh/ap/fantasy/img/profile_96.png</url>
        </team_logo>
      </team_logos>
      <waiver_priority>9</waiver_priority>
      <number_of_moves>18</number_of_moves>
      <number_of_trades>0</number_of_trades>
      <roster_adds>
        <coverage_type>week</coverage_type>
        <coverage_value>25</coverage_value>
        <value>0</value>
      </roster_adds>
      <league_scoring_type>roto</league_scoring_type>
      <draft_position>3</draft_position>
      <has_draft_grade>0</has_draft_grade>
      <managers>
        <manager>
          <manager_id>3</manager_id>
          <nickname>Andrew</nickname>
          <guid>OFWR6UB5YDFVEZDE3YL3B7IGV4</guid>
          <is_current_login>1</is_current_login>
          <email>petit.13@osu.edu</email>
          <image_url>https://ct.yimg.com/cy/1768/39361574426_98028a_64sq.jpg</image_url>
        </manager>
      </managers>
    </team>
  </teams>"
  end

  let(:leagues_response) do
    "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<fantasy_content xml:lang=\"en-US\" yahoo:uri=\"http://fantasysports.yahooapis.com/fantasy/v2/league/223.l.431\" xmlns:yahoo=\"http://www.yahooapis.com/v1/base.rng\" time=\"181.80584907532ms\" copyright=\"Data provided by Yahoo! and STATS, LLC\" xmlns=\"http://fantasysports.yahooapis.com/fantasy/v2/base.rng\">
      <games count=\"1\">
        <game>
          <game_key>268</game_key>
          <game_id>268</game_id>
                    <leagues count=\"2\">
  <league>
    <league_key>268.l.78659</league_key>
    <league_id>78659</league_id>
    <name>Redlegs Invitational</name>
    <url>https://football.fantasysports.yahoo.com/archive/pnfl/2009/431</url>
    <draft_status>postdraft</draft_status>
    <num_teams>14</num_teams>
    <edit_key>17</edit_key>
    <weekly_deadline/>
    <league_update_timestamp>1262595518</league_update_timestamp>
    <scoring_type>head</scoring_type>
    <current_week>16</current_week>
    <start_week>1</start_week>
    <end_week>16</end_week>
    <is_finished>1</is_finished>
  </league>
  <league>
    <league_key>268.l.57939</league_key>
    <league_id>57939</league_id>
    <name>Redlegs Invitational</name>
    <url>https://football.fantasysports.yahoo.com/archive/pnfl/2009/431</url>
    <draft_status>postdraft</draft_status>
    <num_teams>14</num_teams>
    <edit_key>17</edit_key>
    <weekly_deadline/>
    <league_update_timestamp>1262595518</league_update_timestamp>
    <scoring_type>head</scoring_type>
    <current_week>16</current_week>
    <start_week>1</start_week>
    <end_week>16</end_week>
    <is_finished>1</is_finished>
  </league>
  </leagues>
  </game>
  </games>
</fantasy_content>"
  end
end
