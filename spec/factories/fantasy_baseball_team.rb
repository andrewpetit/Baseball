FactoryGirl.define do
  factory :fantasy_baseball_team do
    # trait :valid do
    league_key { '123.456.789' }
    league_id { '456' }
    team_id { '789' }
    roster_sort_id { 1 }
    team_name { 'Test Team' }
    league_name { 'Test League' }
    is_active { true }
    auto_update { true }
    team_icon_url { '' }
    season { '2017' }
    # end
  end
end
