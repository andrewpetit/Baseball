RSpec.shared_context 'yahoo_roster_response_stubs' do
  let(:roster) do
    [{ 'coverage_type' => ['date'],
       'date' => ['2018-01-10'],
       'is_editable' => ['0'],
       'players' =>
    [{ 'count' => '25',
       'player' =>
    [{ 'player_key' => ['370.p.8609'],
       'player_id' => ['8609'],
       'name' => [{ 'full' => ['Jonathan Lucroy'], 'first' => ['Jonathan'], 'last' => ['Lucroy'], 'ascii_first' => ['Jonathan'], 'ascii_last' => ['Lucroy'] }],
       'status' => ['NA'],
       'status_full' => ['Not Active'],
       'editorial_player_key' => ['mlb.p.8609'],
       'editorial_team_key' => ['mlb.t.27'],
       'editorial_team_full_name' => ['Colorado Rockies'],
       'editorial_team_abbr' => ['Col'],
       'uniform_number' => ['21'],
       'display_position' => ['C,1B'],
       'headshot' =>
    [{ 'url' =>
       ['https://s.yimg.com/iu/api/res/1.2/3dFS2.gICGUKPOhAkOyIpg--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/10162017/8609.1.png'],
       'size' => ['small'] }],
       'image_url' =>
       ['https://s.yimg.com/iu/api/res/1.2/3dFS2.gICGUKPOhAkOyIpg--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/10162017/8609.1.png'],
       'is_undroppable' => ['0'],
       'position_type' => ['B'],
       'eligible_positions' => [{ 'position' => %w[C 1B Util NA] }],
       'has_player_notes' => ['1'],
       'selected_position' => [{ 'coverage_type' => ['date'], 'date' => ['2018-01-10'], 'position' => ['C'] }],
       'is_editable' => ['0'] },
     { 'player_key' => ['370.p.8171'],
       'player_id' => ['8171'],
       'name' => [{ 'full' => ['Jay Bruce'], 'first' => ['Jay'], 'last' => ['Bruce'], 'ascii_first' => ['Jay'], 'ascii_last' => ['Bruce'] }],
       'status' => ['NA'],
       'status_full' => ['Not Active'],
       'editorial_player_key' => ['mlb.p.8171'],
       'editorial_team_key' => ['mlb.t.5'],
       'editorial_team_full_name' => ['Cleveland Indians'],
       'editorial_team_abbr' => ['Cle'],
       'uniform_number' => ['32'],
       'display_position' => ['1B,OF'],
       'headshot' =>
        [{ 'url' =>
           ['https://s.yimg.com/iu/api/res/1.2/ru7lzw4xbnXhz4WHkJfo5g--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/10162017/8171.2.png'],
           'size' => ['small'] }],
       'image_url' =>
           ['https://s.yimg.com/iu/api/res/1.2/ru7lzw4xbnXhz4WHkJfo5g--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/10162017/8171.2.png'],
       'is_undroppable' => ['0'],
       'position_type' => ['B'],
       'eligible_positions' => [{ 'position' => %w[1B OF Util NA] }],
       'selected_position' => [{ 'coverage_type' => ['date'], 'date' => ['2018-01-10'], 'position' => ['1B'] }],
       'is_editable' => ['0'] },
     { 'player_key' => ['370.p.9174'],
       'player_id' => ['9174'],
       'name' => [{ 'full' => ['Brian Dozier'], 'first' => ['Brian'], 'last' => ['Dozier'], 'ascii_first' => ['Brian'], 'ascii_last' => ['Dozier'] }],
       'editorial_player_key' => ['mlb.p.9174'],
       'editorial_team_key' => ['mlb.t.9'],
       'editorial_team_full_name' => ['Minnesota Twins'],
       'editorial_team_abbr' => ['Min'],
       'uniform_number' => ['2'],
       'display_position' => ['2B'],
       'headshot' =>
        [{ 'url' =>
           ['https://s.yimg.com/iu/api/res/1.2/AYs.YBOuSr0oSZu9lHV3lg--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/10162017/9174.1.png'],
           'size' => ['small'] }],
       'image_url' =>
           ['https://s.yimg.com/iu/api/res/1.2/AYs.YBOuSr0oSZu9lHV3lg--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/10162017/9174.1.png'],
       'is_undroppable' => ['0'],
       'position_type' => ['B'],
       'eligible_positions' => [{ 'position' => ['2B', 'Util'] }],
       'has_player_notes' => ['1'],
       'selected_position' => [{ 'coverage_type' => ['date'], 'date' => ['2018-01-10'], 'position' => ['2B'] }],
       'is_editable' => ['0'] },
     { 'player_key' => ['370.p.8588'],
       'player_id' => ['8588'],
       'name' => [{ 'full' => ['Justin Turner'], 'first' => ['Justin'], 'last' => ['Turner'], 'ascii_first' => ['Justin'], 'ascii_last' => ['Turner'] }],
       'editorial_player_key' => ['mlb.p.8588'],
       'editorial_team_key' => ['mlb.t.19'],
       'editorial_team_full_name' => ['Los Angeles Dodgers'],
       'editorial_team_abbr' => ['LAD'],
       'uniform_number' => ['10'],
       'display_position' => ['3B'],
       'headshot' =>
        [{ 'url' =>
           ['https://s.yimg.com/iu/api/res/1.2/d0w_8.TVeD7sdygZPk0GzQ--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/10162017/8588.1.png'],
           'size' => ['small'] }],
       'image_url' =>
           ['https://s.yimg.com/iu/api/res/1.2/d0w_8.TVeD7sdygZPk0GzQ--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/10162017/8588.1.png'],
       'is_undroppable' => ['0'],
       'position_type' => ['B'],
       'eligible_positions' => [{ 'position' => ['3B', 'Util'] }],
       'selected_position' => [{ 'coverage_type' => ['date'], 'date' => ['2018-01-10'], 'position' => ['3B'] }],
       'is_editable' => ['0'] },
     { 'player_key' => ['370.p.8401'],
       'player_id' => ['8401'],
       'name' => [{ 'full' => ['Elvis Andrus'], 'first' => ['Elvis'], 'last' => ['Andrus'], 'ascii_first' => ['Elvis'], 'ascii_last' => ['Andrus'] }],
       'editorial_player_key' => ['mlb.p.8401'],
       'editorial_team_key' => ['mlb.t.13'],
       'editorial_team_full_name' => ['Texas Rangers'],
       'editorial_team_abbr' => ['Tex'],
       'uniform_number' => ['1'],
       'display_position' => ['SS'],
       'headshot' =>
        [{ 'url' =>
           ['https://s.yimg.com/iu/api/res/1.2/10zy_teMg7qLbdW3Hbf2uQ--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/10162017/8401.1.png'],
           'size' => ['small'] }],
       'image_url' =>
           ['https://s.yimg.com/iu/api/res/1.2/10zy_teMg7qLbdW3Hbf2uQ--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/10162017/8401.1.png'],
       'is_undroppable' => ['0'],
       'position_type' => ['B'],
       'eligible_positions' => [{ 'position' => ['SS', 'Util'] }],
       'selected_position' => [{ 'coverage_type' => ['date'], 'date' => ['2018-01-10'], 'position' => ['SS'] }],
       'is_editable' => ['0'] },
     { 'player_key' => ['370.p.8859'],
       'player_id' => ['8859'],
       'name' => [{ 'full' => ['Wil Myers'], 'first' => ['Wil'], 'last' => ['Myers'], 'ascii_first' => ['Wil'], 'ascii_last' => ['Myers'] }],
       'editorial_player_key' => ['mlb.p.8859'],
       'editorial_team_key' => ['mlb.t.25'],
       'editorial_team_full_name' => ['San Diego Padres'],
       'editorial_team_abbr' => ['SD'],
       'uniform_number' => ['4'],
       'display_position' => ['1B,OF'],
       'headshot' =>
        [{ 'url' =>
           ['https://s.yimg.com/iu/api/res/1.2/LaFCqd0QDwdR71gsiM2ZLw--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/10162017/8859.1.png'],
           'size' => ['small'] }],
       'image_url' =>
           ['https://s.yimg.com/iu/api/res/1.2/LaFCqd0QDwdR71gsiM2ZLw--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/10162017/8859.1.png'],
       'is_undroppable' => ['0'],
       'position_type' => ['B'],
       'eligible_positions' => [{ 'position' => %w[1B OF Util] }],
       'selected_position' => [{ 'coverage_type' => ['date'], 'date' => ['2018-01-10'], 'position' => ['OF'] }],
       'is_editable' => ['0'] },
     { 'player_key' => ['370.p.8080'],
       'player_id' => ['8080'],
       'name' => [{ 'full' => ['Justin Upton'], 'first' => ['Justin'], 'last' => ['Upton'], 'ascii_first' => ['Justin'], 'ascii_last' => ['Upton'] }],
       'editorial_player_key' => ['mlb.p.8080'],
       'editorial_team_key' => ['mlb.t.3'],
       'editorial_team_full_name' => ['Los Angeles Angels'],
       'editorial_team_abbr' => ['LAA'],
       'uniform_number' => ['9'],
       'display_position' => ['OF'],
       'headshot' =>
        [{ 'url' =>
           ['https://s.yimg.com/iu/api/res/1.2/tEqhYgj8Ks5vJ2cHfG3Gpw--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/10162017/8080.1.png'],
           'size' => ['small'] }],
       'image_url' =>
           ['https://s.yimg.com/iu/api/res/1.2/tEqhYgj8Ks5vJ2cHfG3Gpw--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/10162017/8080.1.png'],
       'is_undroppable' => ['0'],
       'position_type' => ['B'],
       'eligible_positions' => [{ 'position' => ['OF', 'Util'] }],
       'selected_position' => [{ 'coverage_type' => ['date'], 'date' => ['2018-01-10'], 'position' => ['OF'] }],
       'is_editable' => ['0'] },
     { 'player_key' => ['370.p.8861'],
       'player_id' => ['8861'],
       'name' => [{ 'full' => ['Mike Trout'], 'first' => ['Mike'], 'last' => ['Trout'], 'ascii_first' => ['Mike'], 'ascii_last' => ['Trout'] }],
       'editorial_player_key' => ['mlb.p.8861'],
       'editorial_team_key' => ['mlb.t.3'],
       'editorial_team_full_name' => ['Los Angeles Angels'],
       'editorial_team_abbr' => ['LAA'],
       'uniform_number' => ['27'],
       'display_position' => ['OF'],
       'headshot' =>
        [{ 'url' =>
           ['https://s.yimg.com/iu/api/res/1.2/_R7m_cSSt6eMCpeL3woQ8Q--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/10162017/8861.1.png'],
           'size' => ['small'] }],
       'image_url' =>
           ['https://s.yimg.com/iu/api/res/1.2/_R7m_cSSt6eMCpeL3woQ8Q--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/10162017/8861.1.png'],
       'is_undroppable' => ['0'],
       'position_type' => ['B'],
       'eligible_positions' => [{ 'position' => ['OF', 'Util'] }],
       'selected_position' => [{ 'coverage_type' => ['date'], 'date' => ['2018-01-10'], 'position' => ['OF'] }],
       'is_editable' => ['0'] },
     { 'player_key' => ['370.p.6039'],
       'player_id' => ['6039'],
       'name' => [{ 'full' => ['Adrián Béltre'], 'first' => ['Adrián'], 'last' => ['Béltre'], 'ascii_first' => ['Adrian'], 'ascii_last' => ['Beltre'] }],
       'editorial_player_key' => ['mlb.p.6039'],
       'editorial_team_key' => ['mlb.t.13'],
       'editorial_team_full_name' => ['Texas Rangers'],
       'editorial_team_abbr' => ['Tex'],
       'uniform_number' => ['29'],
       'display_position' => ['3B'],
       'headshot' =>
        [{ 'url' =>
           ['https://s.yimg.com/iu/api/res/1.2/7r0HklztY6hnLuXucKrp3Q--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/10162017/6039.1.png'],
           'size' => ['small'] }],
       'image_url' =>
           ['https://s.yimg.com/iu/api/res/1.2/7r0HklztY6hnLuXucKrp3Q--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/10162017/6039.1.png'],
       'is_undroppable' => ['0'],
       'position_type' => ['B'],
       'eligible_positions' => [{ 'position' => ['3B', 'Util'] }],
       'selected_position' => [{ 'coverage_type' => ['date'], 'date' => ['2018-01-10'], 'position' => ['Util'] }],
       'is_editable' => ['0'] },
     { 'player_key' => ['370.p.8034'],
       'player_id' => ['8034'],
       'name' => [{ 'full' => ['Ryan Braun'], 'first' => ['Ryan'], 'last' => ['Braun'], 'ascii_first' => ['Ryan'], 'ascii_last' => ['Braun'] }],
       'editorial_player_key' => ['mlb.p.8034'],
       'editorial_team_key' => ['mlb.t.8'],
       'editorial_team_full_name' => ['Milwaukee Brewers'],
       'editorial_team_abbr' => ['Mil'],
       'uniform_number' => ['8'],
       'display_position' => ['OF'],
       'headshot' =>
        [{ 'url' =>
           ['https://s.yimg.com/iu/api/res/1.2/PIZ.6C3GEWfofG61x1akZw--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/10162017/8034.1.png'],
           'size' => ['small'] }],
       'image_url' =>
           ['https://s.yimg.com/iu/api/res/1.2/PIZ.6C3GEWfofG61x1akZw--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/10162017/8034.1.png'],
       'is_undroppable' => ['0'],
       'position_type' => ['B'],
       'eligible_positions' => [{ 'position' => ['OF', 'Util'] }],
       'selected_position' => [{ 'coverage_type' => ['date'], 'date' => ['2018-01-10'], 'position' => ['Util'] }],
       'is_editable' => ['0'] },
     { 'player_key' => ['370.p.9338'],
       'player_id' => ['9338'],
       'name' => [{ 'full' => ['Jackie Bradley Jr.'], 'first' => ['Jackie'], 'last' => ['Bradley Jr.'], 'ascii_first' => ['Jackie'], 'ascii_last' => ['Bradley Jr.'] }],
       'editorial_player_key' => ['mlb.p.9338'],
       'editorial_team_key' => ['mlb.t.2'],
       'editorial_team_full_name' => ['Boston Red Sox'],
       'editorial_team_abbr' => ['Bos'],
       'uniform_number' => ['19'],
       'display_position' => ['OF'],
       'headshot' =>
        [{ 'url' =>
           ['https://s.yimg.com/iu/api/res/1.2/RUz7ih5Tp4lq9RsHNRqZVQ--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/10162017/9338.1.png'],
           'size' => ['small'] }],
       'image_url' =>
           ['https://s.yimg.com/iu/api/res/1.2/RUz7ih5Tp4lq9RsHNRqZVQ--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/10162017/9338.1.png'],
       'is_undroppable' => ['0'],
       'position_type' => ['B'],
       'eligible_positions' => [{ 'position' => ['OF', 'Util'] }],
       'selected_position' => [{ 'coverage_type' => ['date'], 'date' => ['2018-01-10'], 'position' => ['BN'] }],
       'is_editable' => ['0'] },
     { 'player_key' => ['370.p.9107'],
       'player_id' => ['9107'],
       'name' => [{ 'full' => ['Jedd Gyorko'], 'first' => ['Jedd'], 'last' => ['Gyorko'], 'ascii_first' => ['Jedd'], 'ascii_last' => ['Gyorko'] }],
       'editorial_player_key' => ['mlb.p.9107'],
       'editorial_team_key' => ['mlb.t.24'],
       'editorial_team_full_name' => ['St. Louis Cardinals'],
       'editorial_team_abbr' => ['StL'],
       'uniform_number' => ['3'],
       'display_position' => ['1B,2B,3B,SS'],
       'headshot' =>
        [{ 'url' =>
           ['https://s.yimg.com/iu/api/res/1.2/F2uJKpy9SKZOj1riRjo.Zg--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/10162017/9107.1.png'],
           'size' => ['small'] }],
       'image_url' =>
           ['https://s.yimg.com/iu/api/res/1.2/F2uJKpy9SKZOj1riRjo.Zg--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/10162017/9107.1.png'],
       'is_undroppable' => ['0'],
       'position_type' => ['B'],
       'eligible_positions' => [{ 'position' => %w[1B 2B 3B SS Util] }],
       'selected_position' => [{ 'coverage_type' => ['date'], 'date' => ['2018-01-10'], 'position' => ['BN'] }],
       'is_editable' => ['0'] },
     { 'player_key' => ['370.p.8057'],
       'player_id' => ['8057'],
       'name' => [{ 'full' => ['Chase Headley'], 'first' => ['Chase'], 'last' => ['Headley'], 'ascii_first' => ['Chase'], 'ascii_last' => ['Headley'] }],
       'editorial_player_key' => ['mlb.p.8057'],
       'editorial_team_key' => ['mlb.t.25'],
       'editorial_team_full_name' => ['San Diego Padres'],
       'editorial_team_abbr' => ['SD'],
       'uniform_number' => ['12'],
       'display_position' => ['1B,3B'],
       'headshot' =>
        [{ 'url' =>
           ['https://s.yimg.com/iu/api/res/1.2/RySVDzxcLy2xYtjmUoEAwA--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/10162017/8057.1.png'],
           'size' => ['small'] }],
       'image_url' =>
           ['https://s.yimg.com/iu/api/res/1.2/RySVDzxcLy2xYtjmUoEAwA--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/10162017/8057.1.png'],
       'is_undroppable' => ['0'],
       'position_type' => ['B'],
       'eligible_positions' => [{ 'position' => %w[1B 3B Util] }],
       'selected_position' => [{ 'coverage_type' => ['date'], 'date' => ['2018-01-10'], 'position' => ['BN'] }],
       'is_editable' => ['0'] },
     { 'player_key' => ['370.p.9604'],
       'player_id' => ['9604'],
       'name' => [{ 'full' => ['Addison Russell'], 'first' => ['Addison'], 'last' => ['Russell'], 'ascii_first' => ['Addison'], 'ascii_last' => ['Russell'] }],
       'editorial_player_key' => ['mlb.p.9604'],
       'editorial_team_key' => ['mlb.t.16'],
       'editorial_team_full_name' => ['Chicago Cubs'],
       'editorial_team_abbr' => ['ChC'],
       'uniform_number' => ['27'],
       'display_position' => ['SS'],
       'headshot' =>
        [{ 'url' =>
           ['https://s.yimg.com/iu/api/res/1.2/OOWWRd4AT0OXk9dduRWR.w--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/04242017/9604.png'],
           'size' => ['small'] }],
       'image_url' =>
           ['https://s.yimg.com/iu/api/res/1.2/OOWWRd4AT0OXk9dduRWR.w--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/04242017/9604.png'],
       'is_undroppable' => ['0'],
       'position_type' => ['B'],
       'eligible_positions' => [{ 'position' => ['SS', 'Util'] }],
       'selected_position' => [{ 'coverage_type' => ['date'], 'date' => ['2018-01-10'], 'position' => ['BN'] }],
       'is_editable' => ['0'] },
     { 'player_key' => ['370.p.8680'],
       'player_id' => ['8680'],
       'name' => [{ 'full' => ['Mike Leake'], 'first' => ['Mike'], 'last' => ['Leake'], 'ascii_first' => ['Mike'], 'ascii_last' => ['Leake'] }],
       'editorial_player_key' => ['mlb.p.8680'],
       'editorial_team_key' => ['mlb.t.12'],
       'editorial_team_full_name' => ['Seattle Mariners'],
       'editorial_team_abbr' => ['Sea'],
       'uniform_number' => ['8'],
       'display_position' => ['SP'],
       'headshot' =>
        [{ 'url' =>
           ['https://s.yimg.com/iu/api/res/1.2/Y7U5hX4u94EucYwfZmvFCw--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/10162017/8680.1.png'],
           'size' => ['small'] }],
       'image_url' =>
           ['https://s.yimg.com/iu/api/res/1.2/Y7U5hX4u94EucYwfZmvFCw--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/10162017/8680.1.png'],
       'is_undroppable' => ['0'],
       'position_type' => ['P'],
       'eligible_positions' => [{ 'position' => ['SP', 'P'] }],
       'selected_position' => [{ 'coverage_type' => ['date'], 'date' => ['2018-01-10'], 'position' => ['SP'] }],
       'is_editable' => ['0'] },
     { 'player_key' => ['370.p.8780'],
       'player_id' => ['8780'],
       'name' => [{ 'full' => ['Chris Sale'], 'first' => ['Chris'], 'last' => ['Sale'], 'ascii_first' => ['Chris'], 'ascii_last' => ['Sale'] }],
       'editorial_player_key' => ['mlb.p.8780'],
       'editorial_team_key' => ['mlb.t.2'],
       'editorial_team_full_name' => ['Boston Red Sox'],
       'editorial_team_abbr' => ['Bos'],
       'uniform_number' => ['41'],
       'display_position' => ['SP'],
       'headshot' =>
        [{ 'url' =>
           ['https://s.yimg.com/iu/api/res/1.2/mGqXsx5XaFVOGmS34Q_0WA--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/20170403/8780.png'],
           'size' => ['small'] }],
       'image_url' =>
           ['https://s.yimg.com/iu/api/res/1.2/mGqXsx5XaFVOGmS34Q_0WA--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/20170403/8780.png'],
       'is_undroppable' => ['0'],
       'position_type' => ['P'],
       'eligible_positions' => [{ 'position' => ['SP', 'P'] }],
       'selected_position' => [{ 'coverage_type' => ['date'], 'date' => ['2018-01-10'], 'position' => ['SP'] }],
       'is_editable' => ['0'] },
     { 'player_key' => ['370.p.9347'],
       'player_id' => ['9347'],
       'name' => [{ 'full' => ['Brandon Maurer'], 'first' => ['Brandon'], 'last' => ['Maurer'], 'ascii_first' => ['Brandon'], 'ascii_last' => ['Maurer'] }],
       'editorial_player_key' => ['mlb.p.9347'],
       'editorial_team_key' => ['mlb.t.7'],
       'editorial_team_full_name' => ['Kansas City Royals'],
       'editorial_team_abbr' => ['KC'],
       'uniform_number' => ['32'],
       'display_position' => ['RP'],
       'headshot' =>
        [{ 'url' =>
           ['https://s.yimg.com/iu/api/res/1.2/LyZ91SSG9VonFzeN3MJBxw--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/04242017/9347.png'],
           'size' => ['small'] }],
       'image_url' =>
           ['https://s.yimg.com/iu/api/res/1.2/LyZ91SSG9VonFzeN3MJBxw--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/04242017/9347.png'],
       'is_undroppable' => ['0'],
       'position_type' => ['P'],
       'eligible_positions' => [{ 'position' => ['RP', 'P'] }],
       'selected_position' => [{ 'coverage_type' => ['date'], 'date' => ['2018-01-10'], 'position' => ['RP'] }],
       'is_editable' => ['0'] },
     { 'player_key' => ['370.p.7401'],
       'player_id' => ['7401'],
       'name' => [{ 'full' => ['Santiago Casilla'], 'first' => ['Santiago'], 'last' => ['Casilla'], 'ascii_first' => ['Santiago'], 'ascii_last' => ['Casilla'] }],
       'editorial_player_key' => ['mlb.p.7401'],
       'editorial_team_key' => ['mlb.t.11'],
       'editorial_team_full_name' => ['Oakland Athletics'],
       'editorial_team_abbr' => ['Oak'],
       'uniform_number' => ['46'],
       'display_position' => ['RP'],
       'headshot' =>
        [{ 'url' =>
           ['https://s.yimg.com/iu/api/res/1.2/VFeUpD9A9EGw6ImVV3pizw--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/20160401/7401.png'],
           'size' => ['small'] }],
       'image_url' =>
           ['https://s.yimg.com/iu/api/res/1.2/VFeUpD9A9EGw6ImVV3pizw--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/20160401/7401.png'],
       'is_undroppable' => ['0'],
       'position_type' => ['P'],
       'eligible_positions' => [{ 'position' => ['RP', 'P'] }],
       'selected_position' => [{ 'coverage_type' => ['date'], 'date' => ['2018-01-10'], 'position' => ['RP'] }],
       'is_editable' => ['0'] },
     { 'player_key' => ['370.p.9121'],
       'player_id' => ['9121'],
       'name' => [{ 'full' => ['Gerrit Cole'], 'first' => ['Gerrit'], 'last' => ['Cole'], 'ascii_first' => ['Gerrit'], 'ascii_last' => ['Cole'] }],
       'editorial_player_key' => ['mlb.p.9121'],
       'editorial_team_key' => ['mlb.t.23'],
       'editorial_team_full_name' => ['Pittsburgh Pirates'],
       'editorial_team_abbr' => ['Pit'],
       'uniform_number' => ['45'],
       'display_position' => ['SP'],
       'headshot' =>
        [{ 'url' =>
           ['https://s.yimg.com/iu/api/res/1.2/h6o3bX5u.TWYO2Z8nLbIuQ--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/10162017/9121.1.png'],
           'size' => ['small'] }],
       'image_url' =>
           ['https://s.yimg.com/iu/api/res/1.2/h6o3bX5u.TWYO2Z8nLbIuQ--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/10162017/9121.1.png'],
       'is_undroppable' => ['0'],
       'position_type' => ['P'],
       'eligible_positions' => [{ 'position' => ['SP', 'P'] }],
       'has_player_notes' => ['1'],
       'has_recent_player_notes' => ['1'],
       'selected_position' => [{ 'coverage_type' => ['date'], 'date' => ['2018-01-10'], 'position' => ['P'] }],
       'is_editable' => ['0'] },
     { 'player_key' => ['370.p.7048'],
       'player_id' => ['7048'],
       'name' => [{ 'full' => ['Adam Wainwright'], 'first' => ['Adam'], 'last' => ['Wainwright'], 'ascii_first' => ['Adam'], 'ascii_last' => ['Wainwright'] }],
       'status' => ['DTD'],
       'status_full' => ['Day-to-Day'],
       'editorial_player_key' => ['mlb.p.7048'],
       'editorial_team_key' => ['mlb.t.24'],
       'editorial_team_full_name' => ['St. Louis Cardinals'],
       'editorial_team_abbr' => ['StL'],
       'uniform_number' => ['50'],
       'display_position' => ['SP'],
       'headshot' =>
        [{ 'url' =>
           ['https://s.yimg.com/iu/api/res/1.2/KeJFrDD0GIvuV4j8UuLkhw--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/10162017/7048.1.png'],
           'size' => ['small'] }],
       'image_url' =>
           ['https://s.yimg.com/iu/api/res/1.2/KeJFrDD0GIvuV4j8UuLkhw--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/10162017/7048.1.png'],
       'is_undroppable' => ['0'],
       'position_type' => ['P'],
       'eligible_positions' => [{ 'position' => ['SP', 'P'] }],
       'selected_position' => [{ 'coverage_type' => ['date'], 'date' => ['2018-01-10'], 'position' => ['P'] }],
       'is_editable' => ['0'] },
     { 'player_key' => ['370.p.9701'],
       'player_id' => ['9701'],
       'name' => [{ 'full' => ['Jacob deGrom'], 'first' => ['Jacob'], 'last' => ['deGrom'], 'ascii_first' => ['Jacob'], 'ascii_last' => ['deGrom'] }],
       'editorial_player_key' => ['mlb.p.9701'],
       'editorial_team_key' => ['mlb.t.21'],
       'editorial_team_full_name' => ['New York Mets'],
       'editorial_team_abbr' => ['NYM'],
       'uniform_number' => ['48'],
       'display_position' => ['SP'],
       'headshot' =>
        [{ 'url' =>
           ['https://s.yimg.com/iu/api/res/1.2/CQsNZcEAW8VdXyqXN1h9KA--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/04242017/9701.png'],
           'size' => ['small'] }],
       'image_url' =>
           ['https://s.yimg.com/iu/api/res/1.2/CQsNZcEAW8VdXyqXN1h9KA--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/04242017/9701.png'],
       'is_undroppable' => ['0'],
       'position_type' => ['P'],
       'eligible_positions' => [{ 'position' => ['SP', 'P'] }],
       'selected_position' => [{ 'coverage_type' => ['date'], 'date' => ['2018-01-10'], 'position' => ['P'] }],
       'is_editable' => ['0'] },
     { 'player_key' => ['370.p.9123'],
       'player_id' => ['9123'],
       'name' => [{ 'full' => ['Jameson Taillon'], 'first' => ['Jameson'], 'last' => ['Taillon'], 'ascii_first' => ['Jameson'], 'ascii_last' => ['Taillon'] }],
       'editorial_player_key' => ['mlb.p.9123'],
       'editorial_team_key' => ['mlb.t.23'],
       'editorial_team_full_name' => ['Pittsburgh Pirates'],
       'editorial_team_abbr' => ['Pit'],
       'uniform_number' => ['50'],
       'display_position' => ['SP'],
       'headshot' =>
        [{ 'url' =>
           ['https://s.yimg.com/iu/api/res/1.2/hN4_Nlss55GBDVbfGm7qEQ--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/10162017/9123.1.png'],
           'size' => ['small'] }],
       'image_url' =>
           ['https://s.yimg.com/iu/api/res/1.2/hN4_Nlss55GBDVbfGm7qEQ--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/10162017/9123.1.png'],
       'is_undroppable' => ['0'],
       'position_type' => ['P'],
       'eligible_positions' => [{ 'position' => ['SP', 'P'] }],
       'selected_position' => [{ 'coverage_type' => ['date'], 'date' => ['2018-01-10'], 'position' => ['P'] }],
       'starting_status' => [{ 'coverage_type' => ['date'], 'date' => ['2018-07-31'], 'is_starting' => ['1'] }],
       'is_editable' => ['0'] },
     { 'player_key' => ['370.p.9635'],
       'player_id' => ['9635'],
       'name' => [{ 'full' => ['Aaron Sanchez'], 'first' => ['Aaron'], 'last' => ['Sanchez'], 'ascii_first' => ['Aaron'], 'ascii_last' => ['Sanchez'] }],
       'status' => ['DTD'],
       'status_full' => ['Day-to-Day'],
       'editorial_player_key' => ['mlb.p.9635'],
       'editorial_team_key' => ['mlb.t.14'],
       'editorial_team_full_name' => ['Toronto Blue Jays'],
       'editorial_team_abbr' => ['Tor'],
       'uniform_number' => ['41'],
       'display_position' => ['SP'],
       'headshot' =>
        [{ 'url' =>
           ['https://s.yimg.com/iu/api/res/1.2/QrNheUGj_o9qTn9nzvO0Fg--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/04242017/9635.png'],
           'size' => ['small'] }],
       'image_url' =>
           ['https://s.yimg.com/iu/api/res/1.2/QrNheUGj_o9qTn9nzvO0Fg--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/04242017/9635.png'],
       'is_undroppable' => ['0'],
       'position_type' => ['P'],
       'eligible_positions' => [{ 'position' => ['SP', 'P'] }],
       'selected_position' => [{ 'coverage_type' => ['date'], 'date' => ['2018-01-10'], 'position' => ['BN'] }],
       'is_editable' => ['0'] },
     { 'player_key' => ['370.p.9245'],
       'player_id' => ['9245'],
       'name' => [{ 'full' => ['Matt Harvey'], 'first' => ['Matt'], 'last' => ['Harvey'], 'ascii_first' => ['Matt'], 'ascii_last' => ['Harvey'] }],
       'editorial_player_key' => ['mlb.p.9245'],
       'editorial_team_key' => ['mlb.t.21'],
       'editorial_team_full_name' => ['New York Mets'],
       'editorial_team_abbr' => ['NYM'],
       'uniform_number' => ['33'],
       'display_position' => ['SP'],
       'headshot' =>
        [{ 'url' =>
           ['https://s.yimg.com/iu/api/res/1.2/YTmAtj3BzkNEFFgKLqlRNg--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/10162017/9245.1.png'],
           'size' => ['small'] }],
       'image_url' =>
           ['https://s.yimg.com/iu/api/res/1.2/YTmAtj3BzkNEFFgKLqlRNg--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/10162017/9245.1.png'],
       'is_undroppable' => ['0'],
       'position_type' => ['P'],
       'eligible_positions' => [{ 'position' => ['SP', 'P'] }],
       'selected_position' => [{ 'coverage_type' => ['date'], 'date' => ['2018-01-10'], 'position' => ['DL'] }],
       'is_editable' => ['0'] },
     { 'player_key' => ['370.p.9597'],
       'player_id' => ['9597'],
       'name' => [{ 'full' => ['Noah Syndergaard'], 'first' => ['Noah'], 'last' => ['Syndergaard'], 'ascii_first' => ['Noah'], 'ascii_last' => ['Syndergaard'] }],
       'editorial_player_key' => ['mlb.p.9597'],
       'editorial_team_key' => ['mlb.t.21'],
       'editorial_team_full_name' => ['New York Mets'],
       'editorial_team_abbr' => ['NYM'],
       'uniform_number' => ['34'],
       'display_position' => ['SP'],
       'headshot' =>
        [{ 'url' =>
           ['https://s.yimg.com/iu/api/res/1.2/0B.rtdcCuQ89HwuqN3NDYg--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/04242017/9597.png'],
           'size' => ['small'] }],
       'image_url' =>
           ['https://s.yimg.com/iu/api/res/1.2/0B.rtdcCuQ89HwuqN3NDYg--~B/YXBwaWQ9c2hhcmVkO2NoPTIzMzY7Y3I9MTtjdz0xNzkwO2R4PTg1NztkeT0wO2ZpPXVsY3JvcDtoPTYwO3E9MTAwO3c9NDY-/https://s.yimg.com/xe/i/us/sp/v/mlb_cutout/players_l/04242017/9597.png'],
       'is_undroppable' => ['0'],
       'position_type' => ['P'],
       'eligible_positions' => [{ 'position' => ['SP', 'P'] }],
       'selected_position' => [{ 'coverage_type' => ['date'], 'date' => ['2018-01-10'], 'position' => ['DL'] }],
       'is_editable' => ['0'] }] }] }]
  end

  let(:roster_response) do
    { 'xml:lang' => 'en-US',
      'yahoo:uri' => 'http://fantasysports.yahooapis.com/fantasy/v2/team/370.l.85254.t.9/roster/players',
      'time' => '116.21403694153ms',
      'copyright' => 'Data provided by Yahoo! and STATS, LLC',
      'refresh_rate' => '60',
      'xmlns:yahoo' => 'http://www.yahooapis.com/v1/base.rng',
      'xmlns' => 'http://fantasysports.yahooapis.com/fantasy/v2/base.rng',
      'team' =>
    [{ 'team_key' => ['370.l.85254.t.9'],
       'team_id' => ['9'],
       'name' => ['Titty City'],
       'is_owned_by_current_login' => ['1'],
       'url' => ['https://baseball.fantasysports.yahoo.com/archive/mlb/2017/85254/9'],
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
          'image_url' => ['https://s.yimg.com/wm/modern/images/default_user_profile_pic_64.png'] }] }],
       'roster' => roster }] }
  end
end