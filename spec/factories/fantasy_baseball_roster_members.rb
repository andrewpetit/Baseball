FactoryGirl.define do
  factory :fantasy_baseball_roster_member do
    # fantasy_baseball_roster nil
    headshot_url { 'http://test.jpg' }
    image_url { 'http://test.jpg' }
    first_name { 'Jonathan' }
    last_name { 'Lucroy' }
    external_id { '8609' }
    eligible_positions { 'C,1B,Util,NA' }
    selected_position { 'C' }
    display_position { 'C,1B' }
    uniform_number { '21' }
    position_type { 'B' }
    is_undroppable { false }
    editorial_player_key { 'mlb.p.8609' }
    editorial_team_key { 'mlb.t.27' }
    editorial_team_full_name { 'Colorado Rockies' }
    editorial_team_abbr { 'Col' }
    season_stat_rank { 0 }
  end
end
