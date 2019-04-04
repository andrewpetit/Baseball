RSpec.shared_context 'yahoo_team_response_stubs' do
  let(:valid_team1) do
    build :fantasy_baseball_team,
          league_key: '370.l.85254',
          league_id: '85254',
          team_id: '9',
          roster_sort_id: nil,
          team_name: 'Titty City',
          league_name: 'Redlegs Invitational',
          is_active: nil,
          auto_update: nil,
          team_icon_url: 'https://s.yimg.com/dh/ap/fantasy/img/mlb/icon_3_lg.gif',
          season: '2017'
  end

  let(:valid_team2) do
    build :fantasy_baseball_team,
          league_key: '370.l.85255',
          league_id: '85255',
          team_id: '9',
          roster_sort_id: nil,
          team_name: 'Titty City',
          league_name: 'Redlegs Invitational',
          is_active: nil,
          auto_update: nil,
          team_icon_url: 'https://s.yimg.com/dh/ap/fantasy/img/mlb/icon_3_lg.gif',
          season: '2017'
  end

  let(:valid_user_teams) do
    [valid_team1, valid_team2]
  end
  let(:teams_count) { '2' }
  let(:unstarted_team) do
    { 'type' => 'auto', 'team_key' => ['370.l.auto.t.41372'], 'team_id' => ['41372'], 'name' => ["Andrew's Team"] }
  end
  let(:team) { [team1, team2] }
  let(:team1) do
    { 'team_key' => ['370.l.85254.t.9'],
      'team_id' => ['9'],
      'name' => ['Titty City'],
      'is_owned_by_current_login' => ['1'],
      'url' => ['https://baseball.fantasysports.yahoo.com/b1/85254/9'],
      'team_logos' => [{ 'team_logo' => [{ 'size' => ['large'], 'url' => ['https://s.yimg.com/dh/ap/fantasy/img/mlb/icon_3_lg.gif'] }] }],
      'waiver_priority' => ['5'],
      'number_of_moves' => ['6'],
      'number_of_trades' => ['0'],
      'roster_adds' => [{ 'coverage_type' => ['week'], 'coverage_value' => ['25'], 'value' => ['0'] }],
      'league_scoring_type' => ['roto'],
      'draft_position' => ['2'],
      'has_draft_grade' => ['0'],
      'managers' =>
    [{ 'manager' =>
       [{ 'manager_id' => ['9'],
          'nickname' => ['Andrew'],
          'guid' => ['OFWR6UB5YDFVEZDE3YL3B7IGV4'],
          'is_current_login' => ['1'],
          'email' => ['andrew.t.petit@gmail.com'],
          'image_url' => ['https://s.yimg.com/wm/modern/images/default_user_profile_pic_64.png'] }] }] }
  end
  let(:team2) do
    { 'team_key' => ['370.l.85255.t.9'],
      'team_id' => ['9'],
      'name' => ['Titty City'],
      'is_owned_by_current_login' => ['1'],
      'url' => ['https://baseball.fantasysports.yahoo.com/b1/85254/9'],
      'team_logos' => [{ 'team_logo' => [{ 'size' => ['large'], 'url' => ['https://s.yimg.com/dh/ap/fantasy/img/mlb/icon_3_lg.gif'] }] }],
      'waiver_priority' => ['5'],
      'number_of_moves' => ['6'],
      'number_of_trades' => ['0'],
      'roster_adds' => [{ 'coverage_type' => ['week'], 'coverage_value' => ['25'], 'value' => ['0'] }],
      'league_scoring_type' => ['roto'],
      'draft_position' => ['2'],
      'has_draft_grade' => ['0'],
      'managers' =>
       [{ 'manager' =>
          [{ 'manager_id' => ['9'],
             'nickname' => ['Andrew'],
             'guid' => ['OFWR6UB5YDFVEZDE3YL3B7IGV4'],
             'is_current_login' => ['1'],
             'email' => ['andrew.t.petit@gmail.com'],
             'image_url' => ['https://s.yimg.com/wm/modern/images/default_user_profile_pic_64.png'] }] }] }
  end

  let(:game_count) { '3' }
  let(:game) do
    [{ 'game_key' => ['370'],
       'game_id' => ['370'],
       'name' => ['Baseball'],
       'code' => ['mlb'],
       'type' => ['full'],
       'url' => ['https://baseball.fantasysports.yahoo.com/b1'],
       'season' => ['2017'],
       'is_registration_over' => ['1'],
       'is_game_over' => ['1'],
       'is_offseason' => ['0'],
       'teams' =>
    [{ 'count' => teams_count,
       'team' => team }] },
     { 'game_key' => ['371'],
       'game_id' => ['371'],
       'name' => ['Football'],
       'code' => ['nfl'],
       'type' => ['full'],
       'url' => ['https://football.fantasysports.yahoo.com/f1'],
       'season' => ['2017'],
       'is_registration_over' => ['0'],
       'is_game_over' => ['1'],
       'is_offseason' => ['0'],
       'teams' =>
           [{ 'count' => '1',
              'team' =>
           [{ 'team_key' => ['371.l.620098.t.9'],
              'team_id' => ['9'],
              'name' => ['Titty City'],
              'is_owned_by_current_login' => ['1'],
              'url' => ['https://football.fantasysports.yahoo.com/f1/620098/9'],
              'team_logos' => [{ 'team_logo' => [{ 'size' => ['large'], 'url' => ['https://s.yimg.com/dh/ap/fantasy/nfl/img/icon_11_100.png'] }] }],
              'waiver_priority' => ['1'],
              'number_of_moves' => ['1'],
              'number_of_trades' => ['0'],
              'roster_adds' => [{ 'coverage_type' => ['week'], 'coverage_value' => ['4'], 'value' => ['0'] }],
              'league_scoring_type' => ['head'],
              'has_draft_grade' => ['1'],
              'draft_grade' => ['C+'],
              'draft_recap_url' => ['https://football.fantasysports.yahoo.com/f1/620098/9/draftrecap'],
              'managers' =>
           [{ 'manager' =>
              [{ 'manager_id' => ['9'],
                 'nickname' => ['Andrew'],
                 'guid' => ['OFWR6UB5YDFVEZDE3YL3B7IGV4'],
                 'is_current_login' => ['1'],
                 'email' => ['andrew.t.petit@gmail.com'],
                 'image_url' => ['https://s.yimg.com/wm/modern/images/default_user_profile_pic_64.png'] }] }] }] }] },
     { 'game_key' => ['372'],
       'game_id' => ['372'],
       'name' => ["Pro Football Pick'em"],
       'code' => ['nflp'],
       'type' => ['pickem-group'],
       'url' => ['https://football.fantasysports.yahoo.com/pickem'],
       'season' => ['2017'],
       'is_registration_over' => ['0'],
       'is_game_over' => ['1'],
       'is_offseason' => ['0'],
       'current_week' => ['4'],
       'teams' =>
        [{ 'count' => '1',
           'team' =>
        [{ 'team_key' => ['372.g.8197.t.10'],
           'team_id' => ['10'],
           'name' => ['Andrew Petit'],
           'is_owned_by_current_login' => ['1'],
           'url' => ['https://football.fantasysports.yahoo.com/pickem/8197/10'],
           'points' => ['32'],
           'wins' => ['32'],
           'losses' => ['16'],
           'can_edit_current_week' => ['1'],
           'rank' => ['4'] }] }] }]
  end

  let(:teams_response) do
    { 'xGNNBVLml:lang' => 'en-US',
      'yahoo:uri' => 'http://fantasysports.yahooapis.com/fantasy/v2/users;use_login=1/games;is_available=1/teams',
      'time' => '145.33710479736ms',
      'copyright' => 'Data provided by Yahoo! and STATS, LLC',
      'refresh_rate' => '60',
      'xmlns:yahoo' => 'http://www.yahooapis.com/v1/base.rng',
      'xmlns' => 'http://fantasysports.yahooapis.com/fantasy/v2/base.rng',
      'users' =>
    [{ 'count' => '1',
       'user' =>
    [{ 'guid' => ['OFWR6UB5YDFVEZDE3YL3B7IGV4'],
       'games' =>
    [{ 'count' => game_count,
       'game' => game }] }] }] }
  end

  let(:parsed_teams_response) do
    [{ 'game_key' => ['370'],
       'game_id' => ['370'],
       'name' => ['Titty City'],
       'code' => ['mlb'],
       'type' => ['full'],
       'url' => ['https://baseball.fantasysports.yahoo.com/b1/85254/9'],
       'season' => ['2017'],
       'is_registration_over' => ['1'],
       'is_game_over' => ['1'],
       'is_offseason' => ['0'],
       'team_key' => ['370.l.85254.t.9'],
       'team_id' => ['9'],
       'is_owned_by_current_login' => ['1'],
       'team_logos' => [{ 'team_logo' => [{ 'size' => ['large'], 'url' => ['https://s.yimg.com/dh/ap/fantasy/img/mlb/icon_3_lg.gif'] }] }],
       'waiver_priority' => ['5'],
       'number_of_moves' => ['6'],
       'number_of_trades' => ['0'],
       'roster_adds' => [{ 'coverage_type' => ['week'], 'coverage_value' => ['25'], 'value' => ['0'] }],
       'league_scoring_type' => ['roto'],
       'draft_position' => ['2'],
       'has_draft_grade' => ['0'],
       'team_name' => ['Titty City'],
       'team_icon_url' => ['https://s.yimg.com/dh/ap/fantasy/img/mlb/icon_3_lg.gif'] },
     { 'game_key' => ['370'],
       'game_id' => ['370'],
       'name' => ['Titty City'],
       'code' => ['mlb'],
       'type' => ['full'],
       'url' => ['https://baseball.fantasysports.yahoo.com/b1/85254/9'],
       'season' => ['2017'],
       'is_registration_over' => ['1'],
       'is_game_over' => ['1'],
       'is_offseason' => ['0'],
       'team_key' => ['370.l.85255.t.9'],
       'team_id' => ['9'],
       'is_owned_by_current_login' => ['1'],
       'team_logos' => [{ 'team_logo' => [{ 'size' => ['large'], 'url' => ['https://s.yimg.com/dh/ap/fantasy/img/mlb/icon_3_lg.gif'] }] }],
       'waiver_priority' => ['5'],
       'number_of_moves' => ['6'],
       'number_of_trades' => ['0'],
       'roster_adds' => [{ 'coverage_type' => ['week'], 'coverage_value' => ['25'], 'value' => ['0'] }],
       'league_scoring_type' => ['roto'],
       'draft_position' => ['2'],
       'has_draft_grade' => ['0'],
       'team_name' => ['Titty City'],
       'team_icon_url' => ['https://s.yimg.com/dh/ap/fantasy/img/mlb/icon_3_lg.gif'] }]
  end
end
